package middleware

import (
	"dream/main/application/services"
	"dream/main/application/services/db"
	"dream/main/application/services/email"
	"dream/main/application/services/templs"
)

type ServerMiddleware struct {
	SqlxService *db.SqlxService
	Mail        *email.Service
	Templs      *templs.Service
	AwsS3       *services.AwsS3Service
	Redis       *services.RedisService
}
