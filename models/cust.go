package models

import (
	orm "go-admin/global"
	"go-admin/tools"
)

type Cust struct {

        Id int `json:"id" gorm:"type:int;primary_key"` // 
        SysCode string `json:"sysCode" gorm:"type:varchar(50);"` // 系统编号
        CustName string `json:"custName" gorm:"type:varchar(128);"` // 客户名称
        SimpleName string `json:"simpleName" gorm:"type:varchar(128);"` // 助记名称
        IndustryType string `json:"industryType" gorm:"type:varchar(255);"` // 所属行业
        CustType string `json:"custType" gorm:"type:varchar(255);"` // 客户类型
        CustStatus string `json:"custStatus" gorm:"type:varchar(255);"` // 客户状态
        CustLevel string `json:"custLevel" gorm:"type:varchar(255);"` // 客户星级
        Origin string `json:"origin" gorm:"type:varchar(255);"` // 客户来源
        Location string `json:"location" gorm:"type:varchar(255);"` // 所在地区
        Address string `json:"address" gorm:"type:varchar(255);"` // 详细地址
        EnterpriseSize string `json:"enterpriseSize" gorm:"type:varchar(255);"` // 企业规模
        ParentCust string `json:"parentCust" gorm:"type:int;"` // 上级客户
        Remark string `json:"remark" gorm:"type:varchar(255);"` // 备注信息
        CreateBy string `json:"createBy" gorm:"type:varchar(128);"` // 
        UpdateBy string `json:"updateBy" gorm:"type:varchar(128);"` // 
DataScope   string `json:"dataScope" gorm:"-"`
Params      string `json:"params"  gorm:"-"`
BaseModel
}

func (Cust) TableName() string {
return "rcm_cust"
}

// 创建Cust
func (e *Cust) Create() (Cust, error) {
var doc Cust
result := orm.Eloquent.Table(e.TableName()).Create(&e)
if result.Error != nil {
err := result.Error
return doc, err
}
doc = *e
return doc, nil
}


// 获取Cust
func (e *Cust) Get() (Cust, error) {
var doc Cust
table := orm.Eloquent.Table(e.TableName())

    
        if e.Id != 0 {
        table = table.Where("id = ?", e.Id)
        }
    
    
        if e.CustName != ""  {
        table = table.Where("cust_name = ?", e.CustName)
        }
    
    
    
        if e.IndustryType != ""  {
        table = table.Where("industry_type = ?", e.IndustryType)
        }
    
    
        if e.CustType != ""  {
        table = table.Where("cust_type = ?", e.CustType)
        }
    
    
        if e.CustStatus != ""  {
        table = table.Where("cust_status = ?", e.CustStatus)
        }
    
    
        if e.CustLevel != ""  {
        table = table.Where("cust_level = ?", e.CustLevel)
        }
    
    
        if e.Origin != ""  {
        table = table.Where("origin = ?", e.Origin)
        }
    
    
    
    
    
    
    
    
    
    
    

if err := table.First(&doc).Error; err != nil {
return doc, err
}
return doc, nil
}

// 获取Cust带分页
func (e *Cust) GetPage(pageSize int, pageIndex int) ([]Cust, int, error) {
var doc []Cust

table := orm.Eloquent.Select("*").Table(e.TableName())

        if e.CustName != ""  {
        table = table.Where("cust_name = ?", e.CustName)
        }
    
        if e.IndustryType != ""  {
        table = table.Where("industry_type = ?", e.IndustryType)
        }
    
        if e.CustType != ""  {
        table = table.Where("cust_type = ?", e.CustType)
        }
    
        if e.CustStatus != ""  {
        table = table.Where("cust_status = ?", e.CustStatus)
        }
    
        if e.CustLevel != ""  {
        table = table.Where("cust_level = ?", e.CustLevel)
        }
    
        if e.Origin != ""  {
        table = table.Where("origin = ?", e.Origin)
        }
    

// 数据权限控制(如果不需要数据权限请将此处去掉)
dataPermission := new(DataPermission)
dataPermission.UserId, _ = tools.StringToInt(e.DataScope)
table,err := dataPermission.GetDataScope(e.TableName(), table)
if err != nil {
return nil, 0, err
}
var count int

if err := table.Offset((pageIndex - 1) * pageSize).Limit(pageSize).Find(&doc).Error; err != nil {
return nil, 0, err
}
table.Where("`deleted_at` IS NULL").Count(&count)
return doc, count, nil
}

// 更新Cust
func (e *Cust) Update(id int) (update Cust, err error) {
if err = orm.Eloquent.Table(e.TableName()).Where("id = ?", id).First(&update).Error; err != nil {
return
}

//参数1:是要修改的数据
//参数2:是修改的数据
if err = orm.Eloquent.Table(e.TableName()).Model(&update).Updates(&e).Error; err != nil {
return
}
return
}

// 删除Cust
func (e *Cust) Delete(id int) (success bool, err error) {
if err = orm.Eloquent.Table(e.TableName()).Where("id = ?", id).Delete(&Cust{}).Error; err != nil {
success = false
return
}
success = true
return
}

//批量删除
func (e *Cust) BatchDelete(id []int) (Result bool, err error) {
if err = orm.Eloquent.Table(e.TableName()).Where("id in (?)", id).Delete(&Cust{}).Error; err != nil {
return
}
Result = true
return
}
