package router

import (
	"github.com/gin-gonic/gin"
	"go-admin/middleware"
	"go-admin/apis/custom"
	jwt "go-admin/pkg/jwtauth"
)

// 需认证的路由代码
func registerCustRouter(v1 *gin.RouterGroup, authMiddleware *jwt.GinJWTMiddleware) {

	r := v1.Group("/custom/cust").Use(authMiddleware.MiddlewareFunc()).Use(middleware.AuthCheckRole())
	{
		r.GET("/:id", custom.GetCust)
		r.POST("", custom.InsertCust)
		r.PUT("", custom.UpdateCust)
		r.DELETE("/:id", custom.DeleteCust)
	}
	
	l := v1.Group("/custom").Use(authMiddleware.MiddlewareFunc()).Use(middleware.AuthCheckRole())
	{
		l.GET("/custList",custom.GetCustList)
	}

}
