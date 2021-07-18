; ModuleID = 'll/.hash.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/hash.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::overflow_error" = type { %"class.std::runtime_error" }
%"class.std::runtime_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__1::__libcpp_refstring" = type { i8* }

$_ZNSt3__122__throw_overflow_errorEPKc = comdat any

$_ZNSt14overflow_errorC2EPKc = comdat any

@_ZNSt3__112_GLOBAL__N_112small_primesE = internal unnamed_addr constant [48 x i32] [i32 0, i32 2, i32 3, i32 5, i32 7, i32 11, i32 13, i32 17, i32 19, i32 23, i32 29, i32 31, i32 37, i32 41, i32 43, i32 47, i32 53, i32 59, i32 61, i32 67, i32 71, i32 73, i32 79, i32 83, i32 89, i32 97, i32 101, i32 103, i32 107, i32 109, i32 113, i32 127, i32 131, i32 137, i32 139, i32 149, i32 151, i32 157, i32 163, i32 167, i32 173, i32 179, i32 181, i32 191, i32 193, i32 197, i32 199, i32 211], align 16
@_ZNSt3__112_GLOBAL__N_17indicesE = internal constant [48 x i32] [i32 1, i32 11, i32 13, i32 17, i32 19, i32 23, i32 29, i32 31, i32 37, i32 41, i32 43, i32 47, i32 53, i32 59, i32 61, i32 67, i32 71, i32 73, i32 79, i32 83, i32 89, i32 97, i32 101, i32 103, i32 107, i32 109, i32 113, i32 121, i32 127, i32 131, i32 137, i32 139, i32 143, i32 149, i32 151, i32 157, i32 163, i32 167, i32 169, i32 173, i32 179, i32 181, i32 187, i32 191, i32 193, i32 197, i32 199, i32 209], align 16
@.str = private unnamed_addr constant [22 x i8] c"__next_prime overflow\00", align 1
@_ZTISt14overflow_error = external constant i8*
@_ZTVSt14overflow_error = external unnamed_addr constant { [5 x i8*] }, align 8

; Function Attrs: uwtable
define i64 @_ZNSt3__112__next_primeEm(i64 %0) local_unnamed_addr #0 {
  %2 = icmp ult i64 %0, 212
  br i1 %2, label %3, label %20

3:                                                ; preds = %1, %3
  %4 = phi i32* [ %15, %3 ], [ getelementptr inbounds ([48 x i32], [48 x i32]* @_ZNSt3__112_GLOBAL__N_112small_primesE, i64 0, i64 0), %1 ]
  %5 = phi i64 [ %14, %3 ], [ 48, %1 ]
  %6 = lshr i64 %5, 1
  %7 = getelementptr inbounds i32, i32* %4, i64 %6
  %8 = load i32, i32* %7, align 4, !tbaa !3
  %9 = zext i32 %8 to i64
  %10 = icmp ult i64 %9, %0
  %11 = getelementptr inbounds i32, i32* %7, i64 1
  %12 = xor i64 %6, -1
  %13 = add i64 %5, %12
  %14 = select i1 %10, i64 %13, i64 %6
  %15 = select i1 %10, i32* %11, i32* %4
  %16 = icmp eq i64 %14, 0
  br i1 %16, label %17, label %3

17:                                               ; preds = %3
  %18 = load i32, i32* %15, align 4, !tbaa !3
  %19 = zext i32 %18 to i64
  br label %431

20:                                               ; preds = %1
  %21 = icmp ugt i64 %0, -59
  br i1 %21, label %22, label %23

22:                                               ; preds = %20
  tail call void @_ZNSt3__122__throw_overflow_errorEPKc(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0)) #4
  unreachable

23:                                               ; preds = %20
  %24 = udiv i64 %0, 210
  %25 = mul nuw i64 %24, 210
  %26 = urem i64 %0, 210
  br label %27

27:                                               ; preds = %27, %23
  %28 = phi i32* [ getelementptr inbounds ([48 x i32], [48 x i32]* @_ZNSt3__112_GLOBAL__N_17indicesE, i64 0, i64 0), %23 ], [ %39, %27 ]
  %29 = phi i64 [ 48, %23 ], [ %38, %27 ]
  %30 = lshr i64 %29, 1
  %31 = getelementptr inbounds i32, i32* %28, i64 %30
  %32 = load i32, i32* %31, align 4, !tbaa !3
  %33 = zext i32 %32 to i64
  %34 = icmp ugt i64 %26, %33
  %35 = getelementptr inbounds i32, i32* %31, i64 1
  %36 = xor i64 %30, -1
  %37 = add i64 %29, %36
  %38 = select i1 %34, i64 %37, i64 %30
  %39 = select i1 %34, i32* %35, i32* %28
  %40 = icmp eq i64 %38, 0
  br i1 %40, label %41, label %27

41:                                               ; preds = %27
  %42 = ptrtoint i32* %39 to i64
  %43 = sub i64 %42, ptrtoint ([48 x i32]* @_ZNSt3__112_GLOBAL__N_17indicesE to i64)
  %44 = ashr exact i64 %43, 2
  br label %45

45:                                               ; preds = %421, %41
  %46 = phi i64 [ %427, %421 ], [ %44, %41 ]
  %47 = phi i64 [ %428, %421 ], [ %25, %41 ]
  %48 = phi i64 [ %426, %421 ], [ %24, %41 ]
  %49 = phi i64 [ %422, %421 ], [ undef, %41 ]
  %50 = getelementptr inbounds [48 x i32], [48 x i32]* @_ZNSt3__112_GLOBAL__N_17indicesE, i64 0, i64 %46
  %51 = load i32, i32* %50, align 4, !tbaa !3
  %52 = zext i32 %51 to i64
  %53 = add i64 %47, %52
  br label %65

54:                                               ; preds = %65
  %55 = add nuw nsw i64 %67, 1
  %56 = getelementptr inbounds [48 x i32], [48 x i32]* @_ZNSt3__112_GLOBAL__N_112small_primesE, i64 0, i64 %55
  %57 = load i32, i32* %56, align 4, !tbaa !3
  %58 = zext i32 %57 to i64
  %59 = udiv i64 %53, %58
  %60 = icmp ult i64 %59, %58
  %61 = mul i64 %59, %58
  %62 = icmp eq i64 %53, %61
  %63 = or i1 %60, %62
  %64 = select i1 %60, i64 %53, i64 %76
  br i1 %63, label %77, label %433

65:                                               ; preds = %433, %45
  %66 = phi i64 [ %49, %45 ], [ %64, %433 ]
  %67 = phi i64 [ 5, %45 ], [ %434, %433 ]
  %68 = getelementptr inbounds [48 x i32], [48 x i32]* @_ZNSt3__112_GLOBAL__N_112small_primesE, i64 0, i64 %67
  %69 = load i32, i32* %68, align 4, !tbaa !3
  %70 = zext i32 %69 to i64
  %71 = udiv i64 %53, %70
  %72 = icmp ult i64 %71, %70
  %73 = mul i64 %71, %70
  %74 = icmp eq i64 %53, %73
  %75 = or i1 %72, %74
  %76 = select i1 %72, i64 %53, i64 %66
  br i1 %75, label %77, label %54

77:                                               ; preds = %54, %65
  %78 = phi i64 [ %66, %65 ], [ %76, %54 ]
  %79 = phi i1 [ %72, %65 ], [ %60, %54 ]
  %80 = phi i1 [ %74, %65 ], [ %62, %54 ]
  %81 = phi i64 [ %76, %65 ], [ %64, %54 ]
  %82 = xor i1 %80, true
  %83 = or i1 %79, %82
  br i1 %83, label %429, label %421

84:                                               ; preds = %433, %417
  %85 = phi i64 [ %420, %417 ], [ 211, %433 ]
  %86 = udiv i64 %53, %85
  %87 = icmp ult i64 %86, %85
  br i1 %87, label %431, label %88

88:                                               ; preds = %84
  %89 = mul i64 %86, %85
  %90 = icmp eq i64 %53, %89
  br i1 %90, label %421, label %91

91:                                               ; preds = %88
  %92 = add i64 %85, 10
  %93 = udiv i64 %53, %92
  %94 = icmp ult i64 %93, %92
  br i1 %94, label %431, label %95

95:                                               ; preds = %91
  %96 = mul i64 %93, %92
  %97 = icmp eq i64 %53, %96
  br i1 %97, label %421, label %98

98:                                               ; preds = %95
  %99 = add i64 %85, 12
  %100 = udiv i64 %53, %99
  %101 = icmp ult i64 %100, %99
  br i1 %101, label %431, label %102

102:                                              ; preds = %98
  %103 = mul i64 %100, %99
  %104 = icmp eq i64 %53, %103
  br i1 %104, label %421, label %105

105:                                              ; preds = %102
  %106 = add i64 %85, 16
  %107 = udiv i64 %53, %106
  %108 = icmp ult i64 %107, %106
  br i1 %108, label %431, label %109

109:                                              ; preds = %105
  %110 = mul i64 %107, %106
  %111 = icmp eq i64 %53, %110
  br i1 %111, label %421, label %112

112:                                              ; preds = %109
  %113 = add i64 %85, 18
  %114 = udiv i64 %53, %113
  %115 = icmp ult i64 %114, %113
  br i1 %115, label %431, label %116

116:                                              ; preds = %112
  %117 = mul i64 %114, %113
  %118 = icmp eq i64 %53, %117
  br i1 %118, label %421, label %119

119:                                              ; preds = %116
  %120 = add i64 %85, 22
  %121 = udiv i64 %53, %120
  %122 = icmp ult i64 %121, %120
  br i1 %122, label %431, label %123

123:                                              ; preds = %119
  %124 = mul i64 %121, %120
  %125 = icmp eq i64 %53, %124
  br i1 %125, label %421, label %126

126:                                              ; preds = %123
  %127 = add i64 %85, 28
  %128 = udiv i64 %53, %127
  %129 = icmp ult i64 %128, %127
  br i1 %129, label %431, label %130

130:                                              ; preds = %126
  %131 = mul i64 %128, %127
  %132 = icmp eq i64 %53, %131
  br i1 %132, label %421, label %133

133:                                              ; preds = %130
  %134 = add i64 %85, 30
  %135 = udiv i64 %53, %134
  %136 = icmp ult i64 %135, %134
  br i1 %136, label %431, label %137

137:                                              ; preds = %133
  %138 = mul i64 %135, %134
  %139 = icmp eq i64 %53, %138
  br i1 %139, label %421, label %140

140:                                              ; preds = %137
  %141 = add i64 %85, 36
  %142 = udiv i64 %53, %141
  %143 = icmp ult i64 %142, %141
  br i1 %143, label %431, label %144

144:                                              ; preds = %140
  %145 = mul i64 %142, %141
  %146 = icmp eq i64 %53, %145
  br i1 %146, label %421, label %147

147:                                              ; preds = %144
  %148 = add i64 %85, 40
  %149 = udiv i64 %53, %148
  %150 = icmp ult i64 %149, %148
  br i1 %150, label %431, label %151

151:                                              ; preds = %147
  %152 = mul i64 %149, %148
  %153 = icmp eq i64 %53, %152
  br i1 %153, label %421, label %154

154:                                              ; preds = %151
  %155 = add i64 %85, 42
  %156 = udiv i64 %53, %155
  %157 = icmp ult i64 %156, %155
  br i1 %157, label %431, label %158

158:                                              ; preds = %154
  %159 = mul i64 %156, %155
  %160 = icmp eq i64 %53, %159
  br i1 %160, label %421, label %161

161:                                              ; preds = %158
  %162 = add i64 %85, 46
  %163 = udiv i64 %53, %162
  %164 = icmp ult i64 %163, %162
  br i1 %164, label %431, label %165

165:                                              ; preds = %161
  %166 = mul i64 %163, %162
  %167 = icmp eq i64 %53, %166
  br i1 %167, label %421, label %168

168:                                              ; preds = %165
  %169 = add i64 %85, 52
  %170 = udiv i64 %53, %169
  %171 = icmp ult i64 %170, %169
  br i1 %171, label %431, label %172

172:                                              ; preds = %168
  %173 = mul i64 %170, %169
  %174 = icmp eq i64 %53, %173
  br i1 %174, label %421, label %175

175:                                              ; preds = %172
  %176 = add i64 %85, 58
  %177 = udiv i64 %53, %176
  %178 = icmp ult i64 %177, %176
  br i1 %178, label %431, label %179

179:                                              ; preds = %175
  %180 = mul i64 %177, %176
  %181 = icmp eq i64 %53, %180
  br i1 %181, label %421, label %182

182:                                              ; preds = %179
  %183 = add i64 %85, 60
  %184 = udiv i64 %53, %183
  %185 = icmp ult i64 %184, %183
  br i1 %185, label %431, label %186

186:                                              ; preds = %182
  %187 = mul i64 %184, %183
  %188 = icmp eq i64 %53, %187
  br i1 %188, label %421, label %189

189:                                              ; preds = %186
  %190 = add i64 %85, 66
  %191 = udiv i64 %53, %190
  %192 = icmp ult i64 %191, %190
  br i1 %192, label %431, label %193

193:                                              ; preds = %189
  %194 = mul i64 %191, %190
  %195 = icmp eq i64 %53, %194
  br i1 %195, label %421, label %196

196:                                              ; preds = %193
  %197 = add i64 %85, 70
  %198 = udiv i64 %53, %197
  %199 = icmp ult i64 %198, %197
  br i1 %199, label %431, label %200

200:                                              ; preds = %196
  %201 = mul i64 %198, %197
  %202 = icmp eq i64 %53, %201
  br i1 %202, label %421, label %203

203:                                              ; preds = %200
  %204 = add i64 %85, 72
  %205 = udiv i64 %53, %204
  %206 = icmp ult i64 %205, %204
  br i1 %206, label %431, label %207

207:                                              ; preds = %203
  %208 = mul i64 %205, %204
  %209 = icmp eq i64 %53, %208
  br i1 %209, label %421, label %210

210:                                              ; preds = %207
  %211 = add i64 %85, 78
  %212 = udiv i64 %53, %211
  %213 = icmp ult i64 %212, %211
  br i1 %213, label %431, label %214

214:                                              ; preds = %210
  %215 = mul i64 %212, %211
  %216 = icmp eq i64 %53, %215
  br i1 %216, label %421, label %217

217:                                              ; preds = %214
  %218 = add i64 %85, 82
  %219 = udiv i64 %53, %218
  %220 = icmp ult i64 %219, %218
  br i1 %220, label %431, label %221

221:                                              ; preds = %217
  %222 = mul i64 %219, %218
  %223 = icmp eq i64 %53, %222
  br i1 %223, label %421, label %224

224:                                              ; preds = %221
  %225 = add i64 %85, 88
  %226 = udiv i64 %53, %225
  %227 = icmp ult i64 %226, %225
  br i1 %227, label %431, label %228

228:                                              ; preds = %224
  %229 = mul i64 %226, %225
  %230 = icmp eq i64 %53, %229
  br i1 %230, label %421, label %231

231:                                              ; preds = %228
  %232 = add i64 %85, 96
  %233 = udiv i64 %53, %232
  %234 = icmp ult i64 %233, %232
  br i1 %234, label %431, label %235

235:                                              ; preds = %231
  %236 = mul i64 %233, %232
  %237 = icmp eq i64 %53, %236
  br i1 %237, label %421, label %238

238:                                              ; preds = %235
  %239 = add i64 %85, 100
  %240 = udiv i64 %53, %239
  %241 = icmp ult i64 %240, %239
  br i1 %241, label %431, label %242

242:                                              ; preds = %238
  %243 = mul i64 %240, %239
  %244 = icmp eq i64 %53, %243
  br i1 %244, label %421, label %245

245:                                              ; preds = %242
  %246 = add i64 %85, 102
  %247 = udiv i64 %53, %246
  %248 = icmp ult i64 %247, %246
  br i1 %248, label %431, label %249

249:                                              ; preds = %245
  %250 = mul i64 %247, %246
  %251 = icmp eq i64 %53, %250
  br i1 %251, label %421, label %252

252:                                              ; preds = %249
  %253 = add i64 %85, 106
  %254 = udiv i64 %53, %253
  %255 = icmp ult i64 %254, %253
  br i1 %255, label %431, label %256

256:                                              ; preds = %252
  %257 = mul i64 %254, %253
  %258 = icmp eq i64 %53, %257
  br i1 %258, label %421, label %259

259:                                              ; preds = %256
  %260 = add i64 %85, 108
  %261 = udiv i64 %53, %260
  %262 = icmp ult i64 %261, %260
  br i1 %262, label %431, label %263

263:                                              ; preds = %259
  %264 = mul i64 %261, %260
  %265 = icmp eq i64 %53, %264
  br i1 %265, label %421, label %266

266:                                              ; preds = %263
  %267 = add i64 %85, 112
  %268 = udiv i64 %53, %267
  %269 = icmp ult i64 %268, %267
  br i1 %269, label %431, label %270

270:                                              ; preds = %266
  %271 = mul i64 %268, %267
  %272 = icmp eq i64 %53, %271
  br i1 %272, label %421, label %273

273:                                              ; preds = %270
  %274 = add i64 %85, 120
  %275 = udiv i64 %53, %274
  %276 = icmp ult i64 %275, %274
  br i1 %276, label %431, label %277

277:                                              ; preds = %273
  %278 = mul i64 %275, %274
  %279 = icmp eq i64 %53, %278
  br i1 %279, label %421, label %280

280:                                              ; preds = %277
  %281 = add i64 %85, 126
  %282 = udiv i64 %53, %281
  %283 = icmp ult i64 %282, %281
  br i1 %283, label %431, label %284

284:                                              ; preds = %280
  %285 = mul i64 %282, %281
  %286 = icmp eq i64 %53, %285
  br i1 %286, label %421, label %287

287:                                              ; preds = %284
  %288 = add i64 %85, 130
  %289 = udiv i64 %53, %288
  %290 = icmp ult i64 %289, %288
  br i1 %290, label %431, label %291

291:                                              ; preds = %287
  %292 = mul i64 %289, %288
  %293 = icmp eq i64 %53, %292
  br i1 %293, label %421, label %294

294:                                              ; preds = %291
  %295 = add i64 %85, 136
  %296 = udiv i64 %53, %295
  %297 = icmp ult i64 %296, %295
  br i1 %297, label %431, label %298

298:                                              ; preds = %294
  %299 = mul i64 %296, %295
  %300 = icmp eq i64 %53, %299
  br i1 %300, label %421, label %301

301:                                              ; preds = %298
  %302 = add i64 %85, 138
  %303 = udiv i64 %53, %302
  %304 = icmp ult i64 %303, %302
  br i1 %304, label %431, label %305

305:                                              ; preds = %301
  %306 = mul i64 %303, %302
  %307 = icmp eq i64 %53, %306
  br i1 %307, label %421, label %308

308:                                              ; preds = %305
  %309 = add i64 %85, 142
  %310 = udiv i64 %53, %309
  %311 = icmp ult i64 %310, %309
  br i1 %311, label %431, label %312

312:                                              ; preds = %308
  %313 = mul i64 %310, %309
  %314 = icmp eq i64 %53, %313
  br i1 %314, label %421, label %315

315:                                              ; preds = %312
  %316 = add i64 %85, 148
  %317 = udiv i64 %53, %316
  %318 = icmp ult i64 %317, %316
  br i1 %318, label %431, label %319

319:                                              ; preds = %315
  %320 = mul i64 %317, %316
  %321 = icmp eq i64 %53, %320
  br i1 %321, label %421, label %322

322:                                              ; preds = %319
  %323 = add i64 %85, 150
  %324 = udiv i64 %53, %323
  %325 = icmp ult i64 %324, %323
  br i1 %325, label %431, label %326

326:                                              ; preds = %322
  %327 = mul i64 %324, %323
  %328 = icmp eq i64 %53, %327
  br i1 %328, label %421, label %329

329:                                              ; preds = %326
  %330 = add i64 %85, 156
  %331 = udiv i64 %53, %330
  %332 = icmp ult i64 %331, %330
  br i1 %332, label %431, label %333

333:                                              ; preds = %329
  %334 = mul i64 %331, %330
  %335 = icmp eq i64 %53, %334
  br i1 %335, label %421, label %336

336:                                              ; preds = %333
  %337 = add i64 %85, 162
  %338 = udiv i64 %53, %337
  %339 = icmp ult i64 %338, %337
  br i1 %339, label %431, label %340

340:                                              ; preds = %336
  %341 = mul i64 %338, %337
  %342 = icmp eq i64 %53, %341
  br i1 %342, label %421, label %343

343:                                              ; preds = %340
  %344 = add i64 %85, 166
  %345 = udiv i64 %53, %344
  %346 = icmp ult i64 %345, %344
  br i1 %346, label %431, label %347

347:                                              ; preds = %343
  %348 = mul i64 %345, %344
  %349 = icmp eq i64 %53, %348
  br i1 %349, label %421, label %350

350:                                              ; preds = %347
  %351 = add i64 %85, 168
  %352 = udiv i64 %53, %351
  %353 = icmp ult i64 %352, %351
  br i1 %353, label %431, label %354

354:                                              ; preds = %350
  %355 = mul i64 %352, %351
  %356 = icmp eq i64 %53, %355
  br i1 %356, label %421, label %357

357:                                              ; preds = %354
  %358 = add i64 %85, 172
  %359 = udiv i64 %53, %358
  %360 = icmp ult i64 %359, %358
  br i1 %360, label %431, label %361

361:                                              ; preds = %357
  %362 = mul i64 %359, %358
  %363 = icmp eq i64 %53, %362
  br i1 %363, label %421, label %364

364:                                              ; preds = %361
  %365 = add i64 %85, 178
  %366 = udiv i64 %53, %365
  %367 = icmp ult i64 %366, %365
  br i1 %367, label %431, label %368

368:                                              ; preds = %364
  %369 = mul i64 %366, %365
  %370 = icmp eq i64 %53, %369
  br i1 %370, label %421, label %371

371:                                              ; preds = %368
  %372 = add i64 %85, 180
  %373 = udiv i64 %53, %372
  %374 = icmp ult i64 %373, %372
  br i1 %374, label %431, label %375

375:                                              ; preds = %371
  %376 = mul i64 %373, %372
  %377 = icmp eq i64 %53, %376
  br i1 %377, label %421, label %378

378:                                              ; preds = %375
  %379 = add i64 %85, 186
  %380 = udiv i64 %53, %379
  %381 = icmp ult i64 %380, %379
  br i1 %381, label %431, label %382

382:                                              ; preds = %378
  %383 = mul i64 %380, %379
  %384 = icmp eq i64 %53, %383
  br i1 %384, label %421, label %385

385:                                              ; preds = %382
  %386 = add i64 %85, 190
  %387 = udiv i64 %53, %386
  %388 = icmp ult i64 %387, %386
  br i1 %388, label %431, label %389

389:                                              ; preds = %385
  %390 = mul i64 %387, %386
  %391 = icmp eq i64 %53, %390
  br i1 %391, label %421, label %392

392:                                              ; preds = %389
  %393 = add i64 %85, 192
  %394 = udiv i64 %53, %393
  %395 = icmp ult i64 %394, %393
  br i1 %395, label %431, label %396

396:                                              ; preds = %392
  %397 = mul i64 %394, %393
  %398 = icmp eq i64 %53, %397
  br i1 %398, label %421, label %399

399:                                              ; preds = %396
  %400 = add i64 %85, 196
  %401 = udiv i64 %53, %400
  %402 = icmp ult i64 %401, %400
  br i1 %402, label %431, label %403

403:                                              ; preds = %399
  %404 = mul i64 %401, %400
  %405 = icmp eq i64 %53, %404
  br i1 %405, label %421, label %406

406:                                              ; preds = %403
  %407 = add i64 %85, 198
  %408 = udiv i64 %53, %407
  %409 = icmp ult i64 %408, %407
  br i1 %409, label %431, label %410

410:                                              ; preds = %406
  %411 = mul i64 %408, %407
  %412 = icmp eq i64 %53, %411
  br i1 %412, label %421, label %413

413:                                              ; preds = %410
  %414 = add i64 %85, 208
  %415 = udiv i64 %53, %414
  %416 = icmp ult i64 %415, %414
  br i1 %416, label %431, label %417

417:                                              ; preds = %413
  %418 = mul i64 %415, %414
  %419 = icmp eq i64 %53, %418
  %420 = add i64 %85, 210
  br i1 %419, label %421, label %84

421:                                              ; preds = %417, %410, %403, %396, %389, %382, %375, %368, %361, %354, %347, %340, %333, %326, %319, %312, %305, %298, %291, %284, %277, %270, %263, %256, %249, %242, %235, %228, %221, %214, %207, %200, %193, %186, %179, %172, %165, %158, %151, %144, %137, %130, %123, %116, %109, %102, %95, %88, %77
  %422 = phi i64 [ %81, %77 ], [ %64, %88 ], [ %64, %95 ], [ %64, %102 ], [ %64, %109 ], [ %64, %116 ], [ %64, %123 ], [ %64, %130 ], [ %64, %137 ], [ %64, %144 ], [ %64, %151 ], [ %64, %158 ], [ %64, %165 ], [ %64, %172 ], [ %64, %179 ], [ %64, %186 ], [ %64, %193 ], [ %64, %200 ], [ %64, %207 ], [ %64, %214 ], [ %64, %221 ], [ %64, %228 ], [ %64, %235 ], [ %64, %242 ], [ %64, %249 ], [ %64, %256 ], [ %64, %263 ], [ %64, %270 ], [ %64, %277 ], [ %64, %284 ], [ %64, %291 ], [ %64, %298 ], [ %64, %305 ], [ %64, %312 ], [ %64, %319 ], [ %64, %326 ], [ %64, %333 ], [ %64, %340 ], [ %64, %347 ], [ %64, %354 ], [ %64, %361 ], [ %64, %368 ], [ %64, %375 ], [ %64, %382 ], [ %64, %389 ], [ %64, %396 ], [ %64, %403 ], [ %64, %410 ], [ %64, %417 ]
  %423 = add i64 %46, 1
  %424 = icmp eq i64 %423, 48
  %425 = zext i1 %424 to i64
  %426 = add i64 %48, %425
  %427 = select i1 %424, i64 0, i64 %423
  %428 = mul i64 %426, 210
  br label %45

429:                                              ; preds = %77
  %430 = select i1 %79, i64 %53, i64 %78
  br label %431

431:                                              ; preds = %413, %406, %399, %392, %385, %378, %371, %364, %357, %350, %343, %336, %329, %322, %315, %308, %301, %294, %287, %280, %273, %266, %259, %252, %245, %238, %231, %224, %217, %210, %203, %196, %189, %182, %175, %168, %161, %154, %147, %140, %133, %126, %119, %112, %105, %98, %91, %84, %429, %17
  %432 = phi i64 [ %19, %17 ], [ %430, %429 ], [ %53, %84 ], [ %53, %91 ], [ %53, %98 ], [ %53, %105 ], [ %53, %112 ], [ %53, %119 ], [ %53, %126 ], [ %53, %133 ], [ %53, %140 ], [ %53, %147 ], [ %53, %154 ], [ %53, %161 ], [ %53, %168 ], [ %53, %175 ], [ %53, %182 ], [ %53, %189 ], [ %53, %196 ], [ %53, %203 ], [ %53, %210 ], [ %53, %217 ], [ %53, %224 ], [ %53, %231 ], [ %53, %238 ], [ %53, %245 ], [ %53, %252 ], [ %53, %259 ], [ %53, %266 ], [ %53, %273 ], [ %53, %280 ], [ %53, %287 ], [ %53, %294 ], [ %53, %301 ], [ %53, %308 ], [ %53, %315 ], [ %53, %322 ], [ %53, %329 ], [ %53, %336 ], [ %53, %343 ], [ %53, %350 ], [ %53, %357 ], [ %53, %364 ], [ %53, %371 ], [ %53, %378 ], [ %53, %385 ], [ %53, %392 ], [ %53, %399 ], [ %53, %406 ], [ %53, %413 ]
  ret i64 %432

433:                                              ; preds = %54
  %434 = add nuw nsw i64 %67, 2
  %435 = icmp eq i64 %434, 47
  br i1 %435, label %84, label %65
}

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr hidden void @_ZNSt3__122__throw_overflow_errorEPKc(i8* %0) local_unnamed_addr #1 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call i8* @__cxa_allocate_exception(i64 16) #5
  %3 = bitcast i8* %2 to %"class.std::overflow_error"*
  invoke void @_ZNSt14overflow_errorC2EPKc(%"class.std::overflow_error"* %3, i8* %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(i8* %2, i8* bitcast (i8** @_ZTISt14overflow_error to i8*), i8* bitcast (void (%"class.std::overflow_error"*)* @_ZNSt14overflow_errorD1Ev to i8*)) #4
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %2) #5
  resume { i8*, i32 } %6
}

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt14overflow_errorC2EPKc(%"class.std::overflow_error"* %0, i8* %1) unnamed_addr #0 comdat align 2 {
  %3 = getelementptr %"class.std::overflow_error", %"class.std::overflow_error"* %0, i64 0, i32 0
  tail call void @_ZNSt13runtime_errorC2EPKc(%"class.std::runtime_error"* %3, i8* %1)
  %4 = getelementptr %"class.std::overflow_error", %"class.std::overflow_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt14overflow_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !7
  ret void
}

declare i32 @__gxx_personality_v0(...)

declare void @__cxa_free_exception(i8*) local_unnamed_addr

; Function Attrs: nounwind
declare void @_ZNSt14overflow_errorD1Ev(%"class.std::overflow_error"*) unnamed_addr #2

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

declare void @_ZNSt13runtime_errorC2EPKc(%"class.std::runtime_error"*, i8*) unnamed_addr #3

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }
attributes #5 = { nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"vtable pointer", !6, i64 0}
