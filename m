Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.84.67
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794996412;
	b=RhoHuYmQ+9kqOktXwMzQCE07cE0P2LJMYQJ9gEqVbQ7tA4trcGfBRduiWkuY/6RJLGJK
	 6EeWm3dBNv+WVpEjTwIoRID+/xn45E1SqCZL0bheKvsxiM1bqMXrtTy1IlSuJyVrchjUZ
	 c/Okv6VXNZza9cIh+mNYPn2pIu5CQXiC0E81N8t/+ov8qfekstz5T64rdAmwBCnEOrtLP
	 QVCoGT82DiVsfrxQjbyTlTODSMAoZ5wGPaHcpXwORstVOpkGD7ae2ffhDO1hotqzbeg9M
	 Y5UTnSCqDa8gk9yXQEJq6kYqXv725LQJZ1Ax3O2LGxDQIMxPPpacPB6hyVm10U7MvuQ==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996412;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:x-mailer:
	 Authentication-Results-Original:x-ms-traffictypediagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 x-checkrecipientrouted:nodisclaimer:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vL1VAh+Q2WVktq1uRVffykq0emH08SEg9LuBtgjbPyc=;
	b=Y1HN2ojJIDoDG2ldKquTR97Fz/YwDkkOEZKOZvpevFCin/MgFvOMDuGjxaNQSuc6/KK8
	 GkI9t7KGq3yUSEdGmD37VX4m75H+vVkpIIrj22tdGVHSW/k0ZYylLqE7sw5J47X+68+xA
	 3ve7YJkEj11kQl6hdTjwxSZ+A2ojd3kkzJ1UpqMj9o20ZfVbkL//Qc8YN5Ovxrwi5Co0T
	 JqluqRphl+tqAApvnoRstPyuVGGSt3KnbHb2O67SK7tz9V7G0a2GbxrUkE8rS9o5jpGy1
	 PJDHYRrFIro6XzO3NlpQV8va2qlfcjTUYw9lW5dZhdzeyg8Gez7bwrHHzRGa8xJfoAw==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=L6pKGIxo;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=L6pKGIxo;
	arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.84.67
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C20606A320
	for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 10:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C20606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=L6pKGIxo;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=L6pKGIxo
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=u76STJ3ttFJnYTlC3ki1Zi7jBiSdXlCyU/vK1T76x4gFe1++QJsh3kzyTWkfR/FuFL2wSsJo15HmnjvWg2B91pJH35vEgAI4syV4JyQzUiPuf8PPFXsr0X8hTYEEBqqCvmS+lkp2fWBmptuocQxq8MKZhyvGVEeRb2n8azIVSoEjDpAGXNfYv8r2j5zfE3O68fMAxyDoXGzfKefuhWxJmQzeEX+GF03nrllG2sEGWzCoxIG8TRVk8djiANKLmu/Mr26KLIotSCP4sPCtD6RIftyxyPwhGSuV7lHcL/MeZLFShH2ueT5x+iUo9pD+oZpTM9P+2wof2zaUu/qx45I2vA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vL1VAh+Q2WVktq1uRVffykq0emH08SEg9LuBtgjbPyc=;
 b=gifq57ip9jjhRd1iqFiEo8EbxLDdQSyJM7Ov0ehxyN53li0wlu2Y/NzlxWXBD4J/4As+w9eH0Ool+YJSjmNYrCaqtNbqTflJ3XUNJk/LvWl/11MpnrtcWMfIvuCmyxDabHGOCWkHUn7ZJa6IYv2RL7/92XFj2rc0riCW1/jYb6le+BlMYxLmBYSzvt+URfwmVBPTJK+GSpDZQEFGMulSKsjbuc1sKptk+3ylcyiwUMqCnm8Ir8TkkdVfW7hTS1YuHA1Ua7M7jc+oIiU+UVcKjQsymnAG9XIpMmeRXfbwBXa75hQUlwdwCDNRY5/HzUamASKCfxa/Huo6JQYK2mo6OQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vL1VAh+Q2WVktq1uRVffykq0emH08SEg9LuBtgjbPyc=;
 b=L6pKGIxoqv4icssie9g4ilrdlLLdw4A/6BXRXCdtsqzzDR8UXQ7KtS+kEF0n2dlFQnC7/BgQVY3yZXJlZ774tkxGE7mRxYn74/3/ZnBlM83mfVPx9KWlvnZhWQ/uSSh5EcOn2JsleMPM/t8U64nbQsvtiMyX0O++u4Kz4qHuHyU=
Received: from AS4P189CA0040.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::9)
 by AM8PR08MB6529.eurprd08.prod.outlook.com (2603:10a6:20b:354::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:06:45 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::62) by AS4P189CA0040.outlook.office365.com
 (2603:10a6:20b:5dd::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 10:06:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 18 Nov 2026 10:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTKZwerJL/EEFAlUV/tPe/ZXSkMPosKiitFsvZPrYeuAH8PDy7ztUfD0uiaKKQrboRCNZ7Bcr2blknTR1ccFL5VYzFbWEa0cOjnCqkBYT73dzsCPIxGilTA1ZtCR+g9SZjxo1AypX6f4TuEFD7jkGl3uMlkGEqu2BC7vPcCA8Qcd/3FtLP1dtI3uJQ6ojCYDAy1JqqYkBsqc6g7VoLG0ePOXkJYKCzPYZXKxm5l3maG4/u+yoK0P5TwHaEk+Z2mll5DQ7ej5cpCDvIXR3ASih5ALaY1peRfIRjvLRcBITLIY01ll0GHlRM8H4qLdFp0AtJi2sR7lEOydqNsmnoBrkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vL1VAh+Q2WVktq1uRVffykq0emH08SEg9LuBtgjbPyc=;
 b=RXt2CAHraibthEMjA8cT8zz8XrzCPUYgRuUa/MRx/9SJ4p711cxUYWMnU992a8VVWP8BXQMLz1K3gWTbo2sTySfvsVNcoTdRwDSHDFMfEu1zi+4vyswU/9F4JpKAbEiB1LMcw2glVFQamdlanU00sIuRtfc+kE0VC7S0NBg4Aw6PgJ5sj2vOYusMYXU2gR3T3Kkmvcs+0HGngHsice1gRjsEDKONIfUOE/NHMsw5uxT4anYKziI5eIJBBq4WiUjK6DCEjNU8k5CUhJ/dzu1NsjihbfrtrtuCuGN3QahV8vEGX6a5yBqDfOZ2Bgz7osakUhnRBy9EEcOyL2a93RqWDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vL1VAh+Q2WVktq1uRVffykq0emH08SEg9LuBtgjbPyc=;
 b=L6pKGIxoqv4icssie9g4ilrdlLLdw4A/6BXRXCdtsqzzDR8UXQ7KtS+kEF0n2dlFQnC7/BgQVY3yZXJlZ774tkxGE7mRxYn74/3/ZnBlM83mfVPx9KWlvnZhWQ/uSSh5EcOn2JsleMPM/t8U64nbQsvtiMyX0O++u4Kz4qHuHyU=
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by PAWPR08MB9124.eurprd08.prod.outlook.com (2603:10a6:102:330::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:06:04 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 10:06:04 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar
 E . Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Alex Bennee <alex.bennee@linaro.org>, Armelle
 Laine <armellel@google.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>
Subject: Re: [PATCH v2 3/6] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
Thread-Topic: [PATCH v2 3/6] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Thread-Index: AQHc/KbrLb2oCNZ/z0uhLLNGYVUYabc0c+AAgAAbnQA=
Date: Wed, 18 Nov 2026 10:06:04 +0000
Message-ID: <0B2E2334-E360-427B-B7C7-ED67361C7670@arm.com>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <a375ad8958031fdfd3dc483812ae0231d64c2cb5.1781514628.git.bertrand.marquis@arm.com>
 <av1hWL8f-xJWJP5i@vireshk-B250M-D3H>
In-Reply-To: <av1hWL8f-xJWJP5i@vireshk-B250M-D3H>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|PAWPR08MB9124:EE_|DU2PEPF00028D07:EE_|AM8PR08MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 964ab4d4-e151-4528-6563-08df455ba64b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|261028144727099003|38070700021|10067099003|4143699003|56012099006|11063799006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 +3h2qqbgTltUVr+cnzl3pZlKEfyPZA1nqS95+/7XnxV1OzqrdeI5wyzaWfcu/cvKsrPJhCorZD/Q/M1pBD1FAlg6jMOrbdbZARnISUg70zxc/hbCSwCjw0Bce9WwgwkWqdLfc2csuwLRdA8jnlJbOFPoRkLtZE87f19hoaWu48q/XZlz88HfyIaU8Z+DiqEV3G4mkc5Sa2TZgFmLfGhLMpxQz7F5Ok8vEEtdurC55PJPIP/LbrX+ajT/BnHZ4G+X4DIJZtFrQbgD1Y48c08zx8XNu36JzuCT+TMQNrBhEyGCDGKh5HpgJi7xNGtrJxMfKjdKYSwRbpPdRYelYox7724MZCpPsOQu+b5p/IDXfkHviuFpiJ1bw6gx9h59GXy0gex6MJh3Gn0pnnOH5y8SJwH2lt94IDT4W7Er+Kn6WQJ5tOmClxwmCOPu1hOdoiBXxwXN6mfqfahBo1eRSTunURvososhJ3uNPwFiUC+l73Z/KKE6mP4g2I8jANqoRxCPH0+W5RRwPQ7MMo25zB2n+PCvRctRbXxy+fEGUc8avGKyXi/H4nm3yiR4//Fz6Go/cKkMV2MapBysN5gYvH0HYkuZ+dI8kmBiohaBQCYSm/6l8gMYto7znPAs2HwdzuS3zs4hC441UW8tCv3lM30EPI4C+p37oGFvCY9e+5WnXjtIOutwGfk6uE5XbnYProQANwzh6SL2Qgux2xLhaiWFKWan560m8P6OCwMcgnVWngs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261028144727099003)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AF12A50EC022F64BA1E7508CD768256D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 POPyOPnvmo+dVJkrD4lXsNrRaTZbDYv5S3YMyzhUhMYB8oUcMLWjHwdzQoUh2V1EsdQEyZRRghBDOCMy4bcpYoTqQ7RfhG7ev/gbOQWkye41NAEaqJkgehjOUpjq/58Y0R7oT7vHkpBSJYNR1O2UF7V2vLFfy4/t0mYhSY51Oln1YNC2xCOfSSl7dp1i0S9q19K5LLcYT301VkbTcHZKhIMf4sBjs97TZV/SQlLe2HjvFkdfuCA+XwUsrYX2ZDWTMVd2dfVyjxOrHiQs1mXNhjdwpsy4wr0/dqWosl/T7327MGa8Grh5Tr8r7IuI7/xxiP1j7Qu4eJQ2Wo3knyXGmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9124
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06174056-9f25-412e-905f-08df455b8e99
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|1800799024|35042699022|82310400026|36860700016|23010399003|261028144727099003|10067099003|4143699003|56012099006|11063799006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	msgBKUeN5q2GLDTinLliVlXQTX139MfeEfXox8a/FoKfMHg0J/iuGOlvtLjzZjhCxG75UTjsRN56+GsDAtrVnvO6zazIO8X+osHOQzocRRv6SW+FuZ/a22I7gs3YOnRwk8WrRNuXfgwWzOPr8jAEWJZhL8QEDy9nlJK2I5dasQEVOgRf69z9IYOWgpk9VrWqF+2eUconpadJOPPYsWnsktXQoRpvyZMifx0wU4KyoijmlCPbC3TxbFYp98k6OAGjIQL0zwk9jMh3vMsFzKM5+iu4btYWC15m9fC99DFiEvWf2EEorFzClUxXG835dqRLw0gfdd3XDGg7iBvC4OgCRcnKJIxi4rzZ3gE+shKxLHWFPBzq5Edk2iY6+f1ysYDVYRBuATRtY13lVqjzt4mGhtPBd427VhiZni0j8M3JzQ/O09Ls4NkJ4IMmG8pbkMxrLIxo1kRyO85+CqPjN1qC2Gb0+KZrNdOGVDWdDW41VgwpmvgVIanBLUambd2AsxX/ykxpZF07DxFuCcHjOP4coC4tlsNxCgUMTO6JqOu2TVOUzz9x0yYERrp4+3bpKgfjI7A/OX2GjzFtUV5wnohAQoiN0wCduKARmsgtUtiLDzY7eb9RgH3JJvgldZdm/gOujgJc3Bcw3CxnKp8AFEPFXYExlHfcsQc2x4/5rXhEGxkjiwVEbwjvYMac6sys9iAoOdzLpnZZNbRW9N51nmC9JA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(35042699022)(82310400026)(36860700016)(23010399003)(261028144727099003)(10067099003)(4143699003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b6dwGe4/XtX+0XXaInTv3Vd1PEdYbH3/xi9oFjlLxOrE+bN/kRvWrQ6TNWbBJenl+3q5PXpndLNu4HpT9crmu6Yd+LTk4/eHx0DRF4zxIB2GyAVtxm596GY0T3gp7kxJDYHEdtgMAwywzL3yNoIg/3Qr26RC7jGi/bxu7Ar/QvMuFW90zS9/zAGznX836kx9xbtM9c9WzexDJFqA/9E2ixp6cfqdmu2FdzQhSZThgI/n+FR/kPaSUP+0Nnu040MvbRXzgplQcPk1SJXYK6VPC1SwmZySNQSEP2vWJ5wSSviaii4HP40Uq85XWmA3cdiDJl36bxvCDNF9GZwPGsHVp+1wFF9XJA8XihN4FCyqfzCmVdTtGLyoy3zscgYDglx++eWk+ExlNRrBpi1+ZTrZonWlRcegPIucvyWABuZM5B6I0GX74PZ/i/j2hYny2tUf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:06:44.3176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 964ab4d4-e151-4528-6563-08df455ba64b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6529

Hi Viresh,

Thanks for pointing this out.

> On 18 Nov 2026, at 09:27, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hi Bertrand,
>
> On 15-06-26, 11:10, Bertrand Marquis wrote:
>> +\busdef{EVENT_DEVICE}
>> +
>> +\busref{EVENT_DEVICE} signals device-level hotplug changes as a bus-ori=
ginated
>> +control-plane event. The bus instance on the driver side receives these
>> +indications from the peer bus instance; the table below lists the defin=
ed
>> +device bus states.
>> +
>> +\begin{lstlisting}
>> +struct virtio_bus_msg_event_device {
>> +        le16 device_number;
>> +        le16 device_bus_state; /* see table below */
>> +};
>> +\end{lstlisting}
>> +
>> +\begin{tabular}{|l|l|p{7cm}|}
>> +\hline
>> +Constant & Value & Meaning \\
>> +\hline
>> +DEVICE\_BUS\_STATE\_ADDED    & 0x0001 & Device is present and ready. \\
>> +DEVICE\_BUS\_STATE\_REMOVED  & 0x0002 & Device is no longer present. \\
>> +Reserved                    & 0x0003-0x7FFF & Reserved for standard use=
. \\
>> +Implementation-defined      & 0x8000-0xFFFF & MAY be used by the bus im=
plementation. \\
>> +\hline
>> +\end{tabular}
>> +
>> +Upon receiving DEVICE\_BUS\_STATE\_ADDED, drivers typically probe the d=
evice
>> +with \msgref{GET_DEVICE_INFO} before continuing initialization. Upon re=
ceiving
>> +DEVICE\_BUS\_STATE\_REMOVED, drivers typically stop queueing new work, =
quiesce
>> +the device instance, tear down local driver state, and release resource=
s.
>> +Duplicate or out-of-order events can occur and can be handled with addi=
tional
>> +bus-level monitoring, such as \busref{PING}.
>
> The Virtio spec doesn't talk about a value of 0 here but the FFA spec
> says this:
>
> The message includes a device change state, which may be one of the
> following:
> - Device Ready: A new Virtio Device has been added and is available
>  for initialization.
> - Device Not Present: A previously exposed Virtio Device has been
>  removed.
> - No Data: The device set has changed, but the device endpoint cannot
>  identify which Virtio Devices were added or removed.
>
> If the state is Device Ready or Device Not Present, the message
> includes the Device Number of the affected Virtio Device. If the state
> is No Data, the Device Number is set to 0. In this case, the driver
> endpoint must re-enumerate the Virtio Device list using
> BUS_MSG_GET_DEVICES.
>
> --------------------
>
> Perhaps the virtio-msg requires an update regarding this ? And maybe
> we need the re-enumeration for other bus implementations too ? Also,
> we must define what a value of 0 means here.

Agreed. I'll define state 0 as NO_DATA to indicate that a change has
occurred, without specifying its nature or identifying individual
devices. The bus binding would define the required handling.

During my investigations, killing QEMU removed all the devices it
provided while the bus implementation remained operational. For FF-A,
this indication could make the driver-side bus initiate the existing
bus reset procedure, remove its local devices, and then rediscover and
initialize the available devices. Other bindings could use a rescan or
another appropriate procedure.

The event would retain its existing payload, with device_number set to
zero and ignored by the receiver. Existing safe-removal and device-number
reuse requirements would still apply.

Tell me if you agree with this direction and I will include that in a v3.

Cheers
Bertrand

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
