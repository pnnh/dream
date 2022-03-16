package middleware

import (
	"sfx_server/main/application/services"
	"sfx_server/main/application/services/db"
	"sfx_server/main/application/services/email"
	"sfx_server/main/application/services/templs"
)

type ServerMiddleware struct {
	SqlxService *db.SqlxService
	Mail        *email.Service
	Templs      *templs.Service
	AwsS3       *services.AwsS3Service
	Redis       *services.RedisService
}
