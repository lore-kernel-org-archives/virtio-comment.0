Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012013.outbound.protection.outlook.com [52.101.43.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15403BE636
	for <virtio-comment@lists.linux.dev>; Wed,  1 Jul 2026 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782919819; cv=fail; b=nyo2zP+kRkkNDi4PSuoq4HsdmA4sEkd5QExo5nwD0Ok1lgFdMuf/JInEYdv3pvoJ5jAFqSiRSH/c6gvX9NdvoxWAjS/WFxXG0F1La/x4s8+ilcVhKxHLtW8L+COugb+D9pm5xtPBad/Sybep1pnbb0PjOtCfAhlEuJwym8qHzOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782919819; c=relaxed/simple;
	bh=B1nZFt9vXJTMJ1HjQHOGFb2HnL+6596zBO5uyhTK3RI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DV+6+J8Ge2HKl6RiSD5Xs5HWGXNMxDViYAU7mh9yWxNv4cW8JZbkDE1J5iEeiEbRjKjPdG1zWSOh6CNL5Fap404L40NojsSfjsCZyW5WinSijx8ftTAbZL0fYkxV7M3yH7oKMW1m9s3yAN02KjPrIC/3WS/FtxBEyKFI27rWV/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S0uYBF+f; arc=fail smtp.client-ip=52.101.43.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S0uYBF+f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f32wG5IRHTGGkBt7uQiPb3cTijvrA/jc77IEkV3HCvJXyfWikaB1JzOkXo8H7IyG+NMkNorWqqQRs7OFuHHqAlPxVRLxU7gdCDcIkDX+wCPyv6VTLnN8m0Dt786n3dvELJnUfKy+RP2o6RRDYeI4T2kkZIyc6wIRazqmEfaloA9QOYFYqkEUCjFoV6p8tAR7oSDoQMzvt2FUmWClEoxfyy9JNbTgKv1i6yPoQZaBfj4Ey4i6P346Im4U5310HZG9CDmgvqj339ljI31CsxwmTcQhDSgIH2TJuL3hazUEhTyivj+AQH3dM5V6a6iyd3wxmRVmK2Wcpo70qgylWIHRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1nZFt9vXJTMJ1HjQHOGFb2HnL+6596zBO5uyhTK3RI=;
 b=dPlFNTkwRvG6/kGflqPqTp3AetBpC9CBURMo246Ki3JHcatAGE+3vvZdsVHdg+k/qCgteoY62W4IP0BlD1xL0jE3+bGNIGR40fDJ0Sdgok2/NGvz8QPoWp6xItcSVvadM5wc69Z89eC3fsPxUv0LcdRdUw74UAE+VRPIq4YuN4lx9CNb2liiWPBKLTfCrIXcw6StV4OiMJEi/F6EdJZx1QfGXVPYBjMCMNXry4f6zX9u7SO9ZMM1nvT8hEZ8eiG19eZUOSNib+HeOXLsAd1geQp6VA/+hQtj/aqrnD9tkFOnqOWIBN+QE5FuyH6qYEqpTpO99HOJdjfM++dvtKVw3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1nZFt9vXJTMJ1HjQHOGFb2HnL+6596zBO5uyhTK3RI=;
 b=S0uYBF+fwEytyPOgnpKBWiQi0xdmjVu2a6aMEm5kNHB3/PBxgT3LFRDURJcLTlFMp95s2Pvu4HQzgAySWoo0HpZNmrwdFFTADKMyjySj07+XeSDjMgLTqoNI5RvSOfx/G7MRRxq9GzQRMN4FPUgq7N3muPtfgpsXR08zcYo1F0JrcK8FvPdyHPSnmtZifRLxIyGvVSACA0lKOWC+w6MdvfH47Sg2ZO8HbuprWh2Tv55qeZ2W1ugdP20Vyh8z/T1Av8DCMB0tYZ8dnUfyVmNcl9HcJZdiiOdmP+raHm/eFQa186xT8aG6bJo0QA5hsnIYEZxDoR0arhoAVvtFnFRiig==
Received: from IA1PR12MB8239.namprd12.prod.outlook.com (2603:10b6:208:3f7::19)
 by LVXPR12MB999198.namprd12.prod.outlook.com (2603:10b6:408:3dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Wed, 1 Jul 2026
 15:30:14 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by IA1PR12MB8239.namprd12.prod.outlook.com (2603:10b6:208:3f7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 15:30:09 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%2]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 15:30:09 +0000
From: Parav Pandit <parav@nvidia.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar
 E . Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: RE: [PATCH v2 0/6] virtio-msg transport layer
Thread-Topic: [PATCH v2 0/6] virtio-msg transport layer
Thread-Index: AQHc/KbqsNj7GkW5e0ay8iyLMRkbnbZY40X4gAAASHA=
Date: Wed, 1 Jul 2026 15:30:08 +0000
Message-ID:
 <SJ0PR12MB68066CB4BBBE4B1B84CFD7E2DCF62@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <87ldbuu46o.fsf@draig.linaro.org>
In-Reply-To: <87ldbuu46o.fsf@draig.linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
 SJ0PR12MB6806:EE_|IA1PR12MB8239:EE_|LVXPR12MB999198:EE_
x-ms-office365-filtering-correlation-id: 02ff1633-2316-451d-68f7-08ded785a287
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10070799003|38070700021|22082099003|4143699003|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 ps/r8dbdNYWiLUonaij15tSIiV1NOgh6sWTaM/QQumvVtpJ2QMG3GVv5JtUcLRRsBV5E/8DRBSbIhD9V7ash/njvLaR6YY0zrtHTRKGKapy1RWfpC6Mzrsf3AscX5Ip2aCBdHI/r6Fkst5eMoYIdin8GwXSlC4o9raMbpzk0nQPcZdkIS9hnGVcOF5Vz5tYEQsizW/nxZa4Y/MNxDvxsLG1dtDrcsO8HjP1xR0K3JRArsF4Iawk8hgCZh8KFCYdR1IQCed/J0ZxwEeJ8X7Tt344zQ9zPasdkTww/RUcmp/6XNJyiVURvog6ZsrRGykXLiDLkU3dmSpOJGAwgJUn9/82DBR62A5nITQ4f2eIcHo50Z9cdSW9MDHADPcya8gr1PrOhZCTOjm6OOKRYTVrWsVRGRYpTZ9EP7CRQscxxRANOAHOWA0SYRpMZNS3TtrEy0bTrTSmoVraf21EODncPV4V9XTZKAjhB9FrupDtNojTH7sdL25yrwlQCxhZ6AX89hkvM8fz9JuTcWE1GNEkEzq7xgyylbebiqspW/lApi+9Wb4oq1pHfiN9i69KIxXOVRhXJRytypurshlfAONSSy7BLVy7GCWEQHM1H0ByK+UBYtEF1HQ3ntvO3srLcAmITexuyHrZbQ/z3Y/vj1IZRVFXcbr7Q0S8I3v2RLM8lJc7O2bwggObI3kAVJjn8HRohKOXLbQJJ1ZLI52wWTjVe/7JiORhZ2cIJcQix1nhDi9U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8239.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10070799003)(38070700021)(22082099003)(4143699003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWdIbkNxWitmcXVGOElodUFrU0FIUW9oa1FaSXRhb2w2NFZTUGxzeVBiUFMr?=
 =?utf-8?B?cU9pKzNaREdUMEtDamRFanF4N2cwSlBRdWZscjdqNThVK2ZLZU5kdVZZNXc3?=
 =?utf-8?B?NzZYc2l6clBNbXQ1Qm5MNVhRZ3NqUVMvQWtPTW51MGJHcjljTGpLVExxSGZT?=
 =?utf-8?B?aGk3N1U5QndnZE5SaFpQU0pyQWJqWmJyQmtGeHlEMnYxZzY2TEFJL1hrKzk5?=
 =?utf-8?B?QmlTMXc4YzE3NXFSRW5GZUhQdTZkeElpS1U0OHZFYzk5Q2w1aGQ5TGdxUGlO?=
 =?utf-8?B?dytRU25Ua1dMSEg2VXFxRjF3K0hlbjNvWU94RVNCWmRsRXpDSEVXTkp0Mkpo?=
 =?utf-8?B?MWhlcm5VSDI4YzhpOW1vQmtud3JvaFV5SFdWYU5na2xPSUtKMzVHQktBZWFj?=
 =?utf-8?B?dzVST2RSalk5RXA5Qk9vYjhqaTNYT0swTmpQcGtEMlRnR2tMNzRzb0RMUTJl?=
 =?utf-8?B?WVFJa1BIQmJEVW9rQkwrQnUyejNpUFZjZ3pLbG1OUjJnbkYrMGdBd0ZNYkJs?=
 =?utf-8?B?Z3RNQ1pBcHNiYUxFeU9vOHE5T1liMktXNUxrWGo4S2dxNW9KSTRpVGVzMlgx?=
 =?utf-8?B?aUpnWWRSeDRoMklqVGdQbFIvRFBQM3RmemliQktleVZqVFExYlFSdG1MdG5h?=
 =?utf-8?B?dUtPeTNNeXFOQnNDMTRFRGh3eStJNmpOTHNvN1l0YWRnZnRRRXNZb1hkOGto?=
 =?utf-8?B?bmJFT2lHV0ZTa2VZWTJFNnh0dlVDZVZnZGhvVnlIdzhGZjdRcnNCVG5CQm1K?=
 =?utf-8?B?TGV5OXk5VmMwUWkvMTQvNFdGMkhWR1Y1ZncyZUlVSTZNYkNiNHNaN2ljVld3?=
 =?utf-8?B?eEE4c2xzZ25qcVpkZU80SFBFYlE2M1dGRTlIQTZPbHZTbEI5dkJwT0hoem5D?=
 =?utf-8?B?cTRMUUk2ZGM5L3d1b3U3M2FCeGxQWUY0SjVvUmxyRXE1TFoxeVNGSjFLOFhD?=
 =?utf-8?B?d0UwTzVWZ0tGbmdidnNiQ0p2RDlUNGI2MEZzbnFJeFpuZStlZXZUa1VuY01I?=
 =?utf-8?B?NFVaNVIrOEpEcmRLRTEyb2lvbVhFYXpTYXIzc1hlc2xiakxxV25hK3pKa0Mx?=
 =?utf-8?B?elJSQy84Q2ZxNTdwZ21qVnB1M0JmLzRUVTRyN2cyL2JRVXBjNlg3a2doMG9n?=
 =?utf-8?B?cHFIYWQ2aVNDcitxRFN6SklSVzdpM1duTklyeEUxMVA5ZFVHVCtaSU5Vdks4?=
 =?utf-8?B?VzRxM1BXUFNraHcxSkJNd3hQcWNGOFBvemwvYWF4V0FVODc4NnBWNStzUG1z?=
 =?utf-8?B?MEpjdXNCbjB0WnNGVXg3UVdyMHN6dzRpbXo3Q0lrVXlGcnBwa0pUN0hrVXNF?=
 =?utf-8?B?VEQrcXdPKzRja0ZTRFhQTWIxT2ovWXcvRFBxWHZ6RzFyMElGWkJ2Z1RZbHQv?=
 =?utf-8?B?WDVBOVMyNS94cFZkTUtIU3R2NWE1VkFoWG9XcEU4UG9SRmVTVHJGckdNZ0Jy?=
 =?utf-8?B?T2lCK1QyemZrZkVoRy8xMDNVVW9TWDdVNlJ6Wk5NeFJiZ3o2ZTQ0NlBzdXM2?=
 =?utf-8?B?WGFBa1IzUkhBZEd5OFU1ZnRHWFZjQWNra2dtY1A0S0FPT0hUeFdaeHJiREk2?=
 =?utf-8?B?QjFvT3JHS2M3aCtKL0xJbWhuM29FMTdsWCsvazQ3Q0U1MDZUMjg4cVlNc3Nt?=
 =?utf-8?B?N3hmdXArenhNdXZJaVFoNm44YVVWeDhTNFRIcm8yblJqOFVEUzlkUllnbnBY?=
 =?utf-8?B?T2tQSmdscEhNaUJrTDFEZ29XR1B0Q1llVnB5RUxDWmpSR051cDkzWlJvZ0Er?=
 =?utf-8?B?aCt0eFlMQU9LT0lYUDdnWDNNdUZFQ2xKMSt3c3NQamZ1aHBzTmRqMG1RZ25i?=
 =?utf-8?B?dDFaaWxXbHJ3aC9ZUSs1Y1BxdU5PemhtNFNUMFdIWUFyek5LWDJGM0IxcVIw?=
 =?utf-8?B?d1dYdWpYWi90b3AvOFFmRUhncnNzRjE5MW1pMWtqMnU0NTMreTJkWTVXVDlG?=
 =?utf-8?B?RVZ3MUtsQytzcHdodlEzNUw2RnJsT1NjYVdBajBDZEtlQ1ppRm80cWdmMkZI?=
 =?utf-8?B?RG1HRS9yZmVCcU52akxkNjZGUis2YXNOZkpTdndGT29ZQTA3RXJSSlh0THlC?=
 =?utf-8?B?MXVOZ1lpNlV5Ym5LZE9GcjJXOW9iOHU2S2h3b3dJMGZsd00xK3dtRTM1eURv?=
 =?utf-8?B?dStIcWo3K2liNHNBM3FJb1hYZmFoYURwUFhhR3BaYjA3aFRWTHNydzNZQ1dG?=
 =?utf-8?B?eWgxQ1ZzSkw3Z2VKM0RKNUtLQmdwN2JkZDFYSzVibVlWa01NdDZUVS9DVXhh?=
 =?utf-8?B?RWZnQnErRTBwUFpwSE9xT01nNVdzSE1zZmJUZTlrMXkxbDdWY3JOcjdpK1g2?=
 =?utf-8?B?ZzN5TFB3SGR0S29MNUZLZVRSQjlDQWE4ZDBwQVVTNk9GTGxvVlczS0hBazBQ?=
 =?utf-8?Q?vE4X7F0hRRvgsRI+iiW+2ZGqxp/Vlac4pWind?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ff1633-2316-451d-68f7-08ded785a287
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 15:30:09.0073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xyQfeUvuP937/A/XA4ybVMrwyqtMF5kgLKr0ZRXdUk+QVd3oECgAB5QzBE4ZPW/RUegSXuhVqMQmia7EMmae4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR12MB999198

DQo+IEZyb206IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gU2VudDog
MDEgSnVseSAyMDI2IDA4OjUxIFBNDQo+IFRvOiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5t
YXJxdWlzQGFybS5jb20+DQo+IENjOiB2aXJ0aW8tY29tbWVudEBsaXN0cy5saW51eC5kZXY7IEVk
Z2FyIEUgLiBJZ2xlc2lhcyA8ZWRnYXIuaWdsZXNpYXNAYW1kLmNvbT47IEFybmF1ZCBQb3VsaXF1
ZW4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+Ow0KPiBWaXJlc2ggS3VtYXIgPHZpcmVz
aC5rdW1hckBsaW5hcm8ub3JnPjsgQXJtZWxsZSBMYWluZSA8YXJtZWxsZWxAZ29vZ2xlLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzZdIHZpcnRpby1tc2cgdHJhbnNwb3J0IGxheWVy
DQo+IA0KPiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyaXRl
czoNCj4gDQo+ID4gVGhpcyBzZXJpZXMgYWRkcyB0aGUgdmlydGlvLW1zZyB0cmFuc3BvcnQgbGF5
ZXIuDQo+ID4NCj4gPiBUaGUgaW5kaXZpZHVhbHMgYW5kIG9yZ2FuaXphdGlvbnMgaW52b2x2ZWQg
aW4gdGhpcyBlZmZvcnQgaGF2ZSBoYWQgZGlmZmljdWx0eSBpbg0KPiA+IHVzaW5nIHRoZSBleGlz
dGluZyB2aXJ0aW8tdHJhbnNwb3J0cyBpbiB2YXJpb3VzIHNpdHVhdGlvbnMgYW5kIGRlc2lyZSB0
byBhZGQgb25lDQo+ID4gbW9yZSB0cmFuc3BvcnQgdGhhdCBwZXJmb3JtcyBpdHMgdHJhbnNwb3J0
IGxheWVyIG9wZXJhdGlvbnMgYnkgc2VuZGluZyBhbmQNCj4gPiByZWNlaXZpbmcgbWVzc2FnZXMu
DQo+ID4NCj4gPiBJbXBsZW1lbnRhdGlvbnMgb2YgdmlydGlvLW1zZyB3aWxsIG5vcm1hbGx5IGJl
IGRvbmUgaW4gbXVsdGlwbGUgbGF5ZXJzOg0KPiA+ICogY29tbW9uIC8gZGV2aWNlIGxldmVsDQo+
ID4gKiBidXMgbGV2ZWwNCj4gDQo+IElmIHRoZXJlIGFyZSBubyBjb21tZW50cyBob3cgbG9uZyBz
aG91bGQgd2UgbGVhdmUgaXQgYmVmb3JlIHJlcXVlc3RpbmcgYSB2b3RlPw0KPiANCkkgYW0gc3Rp
bGwgaW4gdGhlIG1pZGRsZSBvZiB2aXJ0by11c2IgcmV2aWV3IHBvc3RlZCBiZWZvcmUgdGhpcy4g
4pi5DQo=
