Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFC7310784
	for <virtio-comment@lists.linux.dev>; Fri, 20 Feb 2026 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771577786; cv=fail; b=nY4R1WpvJNxA1Zfa2HwbwQqDkZbQkKjAGju27P/xwVD3eu/eOXrM87Ux4PuVTrVxQrDkBY0fe+EQtQPST2rDZvhZ9yDOtlz+Bvz/zRLWvyJMFDjtAtNVONRbVhf7q2dk6MlTNVm6zJBNfb6MlyW7ylT3XpIrX7BAJ5RvLDtK6kU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771577786; c=relaxed/simple;
	bh=QmzxlAwHXJbAA3gqbQIiulXnChPpoZNvYAo94jvnjpM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M1iYUuzrTFFJcLwDsX0k+d+y4ssyvb+WZYamNSA83uO7/TZWbRpmZrFUMUfaBgj10icfo56AP1ZE2Vw1QbcbZHDa+Nr4xN1Ac4nr8aLvMXITpAsBi+WidGGY7EwyB4UpoK5y7emDQGeeN2Os8QPpZLovvVnrOvuxLcV95yhIB2w=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=i0kGGxqu; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=i0kGGxqu; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="i0kGGxqu";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="i0kGGxqu"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=beG3kL1I0tN4MSsm0KYjfEMgj9B6EBECwUAC+0wWgZiaN5oJT+xsgyZZms2aDcktdseLJ2EF4mGDFdmGSR8IYPbfmKiXki4g7x1FbspMFxIGUFeMzL0tGU2BpZswVY9Pxi5PxFQqW0rhki++bq8LR9R5848uICswK4tSjwRhWCdHvb3+iFovcgomBFrF/SFxwpc1OUUpHxU9VnZ2iXI7GBuTNWL+U/B5w3nySDTFB26WFSW7haaBU3ipqubPJutLzYpao92MLDYYYL7TyiFoGPrSxNHvQM6GZfU8ap0FfYorEnmrHXPVhKyjP5w2XIB8r9NL9JiLIoCAX3TMYWvWFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfC7cxrES5RCLOncMcOX9tgE3JAqLEzmPBUh5Yoyl/A=;
 b=FzpFV09qu7Hd8/BjCIE71oLhHaFCVzSCM/ttID+TefFdR/olk14gA2mzFE8SWOcVPMgXKximG12B7KHENSJisI8IwlJsH8zV0XhGDkEivTxYoeQ89KGXSP2ClrVhG52qi8+cnY/bg5IUEiKQZppaGCuErSNAREUUuJl8sVUkV54spBPs6lkaInnfcjEcfMlAQHXjy1+MrUpp/aVwBTPPYazf3PHLahICIJ1dkAEkq66JzpEdWeObUT901+5jWlZ4a7a2AWIxj/1Hbdk5QUEVnCzmgy+7r6wFqZNZ+8RlOV5MF5bxlWPM6Ay5ySikeDU/4mWjK0BQBUjvtzyJ7VpPag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfC7cxrES5RCLOncMcOX9tgE3JAqLEzmPBUh5Yoyl/A=;
 b=i0kGGxqunka2EixymxtEjnQJHeKKIw/A4wwIijDanhdgjVELe8+h6aoSbrADmbg2sG6UgAIM1NSfCND+Vaw5VQkLIONMQ5QhELzrf0Hmx8POrj39I9hILC3XbfE4d17nBY9SHSSvflBI5CxPPvwMBtb9fJ1ZFkEq/o7RFz8oCJI=
Received: from AM9P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::23)
 by VE1PR08MB5774.eurprd08.prod.outlook.com (2603:10a6:800:1a1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 08:56:18 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::86) by AM9P195CA0018.outlook.office365.com
 (2603:10a6:20b:21f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 08:56:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Fri, 20 Feb 2026 08:56:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GT3dFV7sN4zPh0vPoyP2XzVz9TWtHtg8Z2jQg6x3L4sqU+qGtde7boDH5qxy5cTURbykvNKB12dnLR11QBJaBP1+lCIhwH2X8ASuZBJWYBJ5nirs+C1I9Fef7TAlG/TUvgl2E3jMrbHzXXKMgQIlnJY8aEMcyXVkMC1q45SDAu6TtONHbQGL51WXko5vv/sz8qRl35PhRl1bTcZ+pAuv9aOd2YTimGf2IbCB3TvmpKcFDXIfjb39N7tAu1sQqTUPCENKco1VIKlU4G4e5CHafVoFsWjbpZ8XxYZLkY0FsU2eHWvtkm60sWX4TLRLII0KBZ7IbTnJfimAWH0zgImhmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfC7cxrES5RCLOncMcOX9tgE3JAqLEzmPBUh5Yoyl/A=;
 b=NuL6f/rSw0h0Wrxyu8Q1+/SAzzDtb0nEr1kJehgIJ0NJ/Hi2a4ena2IBHzkMLlU2OgpCQcJgyMYyKW1ZiNEldNmF6cm27pwUh11MI4w2A6RwgcoUNFMun07VUgvHYXFxM9W6NjJ5ugDgEzgd6TEAhanjuPyh18sjgQa7x1efD0NAQRgadPvVMdLLTVSNPaIAmwkQ1mnq6hYaw32TvqihNv4KtVocMJsvBS80ZhbCHgJKZsqQ4lbYNtRpLJw5ZT/3l9QMI2U0vv9Fgw71XQFbwDUQdAFV6YTeJ7G3gcl8XK8+at2CEHq9Jyq7mu3Bkh+rHmVYzHNqXRulJPGJ+qS0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfC7cxrES5RCLOncMcOX9tgE3JAqLEzmPBUh5Yoyl/A=;
 b=i0kGGxqunka2EixymxtEjnQJHeKKIw/A4wwIijDanhdgjVELe8+h6aoSbrADmbg2sG6UgAIM1NSfCND+Vaw5VQkLIONMQ5QhELzrf0Hmx8POrj39I9hILC3XbfE4d17nBY9SHSSvflBI5CxPPvwMBtb9fJ1ZFkEq/o7RFz8oCJI=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB8301.eurprd08.prod.outlook.com (2603:10a6:10:40f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 08:55:12 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:55:12 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: Parav Pandit <parav@nvidia.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index: AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgABitgCACkqcAA==
Date: Fri, 20 Feb 2026 08:55:12 +0000
Message-ID: <E8A8F65E-1E76-4045-8C79-76BD36593240@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <2d76963e-9aee-490e-99f7-fbd285c3092a@gmail.com>
In-Reply-To: <2d76963e-9aee-490e-99f7-fbd285c3092a@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB8301:EE_|AMS1EPF00000044:EE_|VE1PR08MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb1c8eb-5969-470c-23a4-08de705de8eb
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?fGeuH8FNmSJF0X/puRQtMDsV4qrB/AWVUJlo7k0n+NxltkyaX8plYFybvOaO?=
 =?us-ascii?Q?Fi79ugmu/Zb4t60zYRRBwfbg9i+yWyaVP8hdGO+VWXikZX285AzHCk6XVoum?=
 =?us-ascii?Q?Yo9CKp6Xiuhnz2kGQnKP8VivcNoytZf1A1cEQGDjnJBgkx7T/DgzLCHpSrjK?=
 =?us-ascii?Q?5Hw+qerB8kCwEs/Fc1dnG2ip89hE7UnyZh24IfB2aUzHlN/u9uKW+ycNHdb8?=
 =?us-ascii?Q?ucAM19rLSud8oytyc9jfKbibCXvm8pjgtIzH9Biqy4bAkC59lnousL7PCExo?=
 =?us-ascii?Q?stbtQX3ecLT7cBKGUMmQuArRcO180qpU1PXpRKCBdlZ7OekNGqZMfU/2B1mc?=
 =?us-ascii?Q?TcV+U5vD8VGMoLPGcxSl6B71Tx62zCfPWApZkkM0U1R6R+jvNQcldgj4hft5?=
 =?us-ascii?Q?VODzqttqW4zm8WREVC4Vi/jTmnMuiBbk/TvGbyhSeZ7+p4z28dLjRRsVb1yO?=
 =?us-ascii?Q?g9ZBIQ5ym9x/JYMoYnznpUdO5g93ActwbJG2azr8f9YsgdZHhpunj5z+7/LQ?=
 =?us-ascii?Q?1rKj6WBVd0CASU0HLal2mpNdvlYW3psHDY45OWYOKi/hh+2jCz7rFN4zeojr?=
 =?us-ascii?Q?WikgChI1YR1emGkzaKVbrvr5KTrB0/WUR+M9f0H+MafnsTtS19UeobiOP+U4?=
 =?us-ascii?Q?ItatBO6nQhuEMEPIXHkyQaeLaJMun6/U3ZqHo0VVjeyTPubtWr+ODtNyiQi2?=
 =?us-ascii?Q?LbzPzxhKGeJFw8ssLXcIRbqd3k4i1bQpr/vh7vDHICgDdxPL/HzYKtH+gbX8?=
 =?us-ascii?Q?HeavkNC/PVJPC4Vr5maxPdu2JmvAYaiY6Qyn2zKN2hLh46o5aNx4WEzBcm8A?=
 =?us-ascii?Q?pdW1QVDPoWkKmuupL5axMjhPFST943YF3QmplF7r4eOAMcd+q2yoay/s9hYP?=
 =?us-ascii?Q?FWJniOI62MENgDyoql4FHrHT1VGysg/J2M/s5hTvBPGiRG4c3uGfquirgXgH?=
 =?us-ascii?Q?T3g0bo8cxp62RUqzaIUmvuSPdHiNbTJTdbqsT/8GBz8pknjdZrZDKa8MQzQB?=
 =?us-ascii?Q?MJ7AbjkmWKPxF0nBlHj3XqlfnjbpqO7BpI1PqttEPFD6o7AzQPHKiJ//JzJg?=
 =?us-ascii?Q?M1EVWivPfSBkwrPYr7BfuGFMja7tlAA1a1BvOq+rNHzXSvtmotc6P5L69O9k?=
 =?us-ascii?Q?Lgy6AbbktgN7IFkEF+kuwwIyQDUzBxWCTBxol1mzrJdvOhrN1Sj9u1OES9wD?=
 =?us-ascii?Q?QBdbSZeEoegott0IA9ZGxQDCv3w5uWgktzzPcSNFgX67uPXygzBgakr6XQOr?=
 =?us-ascii?Q?a8hj00vRVvuYZNZOXQY/fZ/QBFiMS0Km5kfLPJySqLlrKpdgn/+3zIcoKCgP?=
 =?us-ascii?Q?goQblyXcJX497ljAs1jsJ8R5etQwV0cGUnE2V0yhSmFZMoh1fGvkWIP4YdoB?=
 =?us-ascii?Q?mjcVQNh8WhZcb3odoRu2azEDRlF/AcrRmDiS4QQuewKFFerAgWLo1p06mYU/?=
 =?us-ascii?Q?jCccFzYlYxjk58ynLOXjC6KBVkBiN/qWLc4NUdxoebVC9iAjoKbB+SU5NpvT?=
 =?us-ascii?Q?twz+3lNGTA0dwOIH3xXPmGOSaM0YMXHNQT8JnHS/Z1q/V2SmWXpPwSPB6JSv?=
 =?us-ascii?Q?ehES0P56dAJ8kuUnJL7AHiIz/9fasRMIeI+Nqr7uPgwRTu2+3BOKJIz8LvBP?=
 =?us-ascii?Q?SYuqcy0xfJuFo3xxF+DobiY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21C76962BE097048AD74DB13CE9861C1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8301
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	42288745-4004-49cd-f4a5-08de705dc236
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|35042699022|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i29iCkSjIg9EWFQCjBfd8JMxA4CjTkpajKw6eIUNgh0rMQOyjWwsBce61WE0?=
 =?us-ascii?Q?J944ynf2KovZ7Lid/LBObVhUlfVVCksyRpWbfDm31ppvZTn0/OcAhlMwu6Vf?=
 =?us-ascii?Q?o7b/+lg1KuNRJWSJLGYylT8WBOx39HHO8hclyKwyLu/RtzGp3MD7fBS6W1EK?=
 =?us-ascii?Q?mQkp3wDjak2Qp3gzoKYF+UxCxOkzJegFNQ+02gpJeUOjnn7ZlEYq+HLdbA05?=
 =?us-ascii?Q?3AVUKP1x4wQDQ7EahphGYO2gZ3KJCT9NgjMnxag4pn9sB/lYttBpxR9GNYdA?=
 =?us-ascii?Q?Wh6BaNOCN5f49Lcrbra4i4i0xXEmDC6Y0pXMDbeeMODIDNCB+15ijw6hEF4W?=
 =?us-ascii?Q?OlCXTJPoXxR/AG9c6+1FosqlXDt1Xj9Noummx+TQJ2K23GEj8Jz7CtrjJEX8?=
 =?us-ascii?Q?R1nsc0U6+eDfMq6qtcXq2ut00UUFLprzSYZ0xpuX3e7efmR0Dah8TGSLglIv?=
 =?us-ascii?Q?2ho7TNq+JgqJ2oQZY7CbNc2BLvSDaA4R6DaPiZDauQKGnZA5kpQyByrO9nno?=
 =?us-ascii?Q?MVuRDEewOhEQJcsdqD/eYtbCtqKpPPmZ7snMpsdRbKTw2FUV28PHMrTCYy1R?=
 =?us-ascii?Q?1W1kc02nMKBR8QGXx2Od8CBMSbcnhlsWhlYpYDis6qsWlXos0xE88U1S3HVo?=
 =?us-ascii?Q?RaB7+j9CjJw/LXkDb1aea/r1Kz2vzEyxLoRMF2Lypaf4wljCl0X0yBcxfy/G?=
 =?us-ascii?Q?rI6zf3B4rvngl9s0vedSF/fS8keN7dkPb8lQ3+ErAsrEg+YAu4Q/6z7RQwtQ?=
 =?us-ascii?Q?jIcZu14CR0S7Oj9MHAjfahFw6peb4gyG4LcXkU28Zl4cLqHiKTPXUNkQC+Ca?=
 =?us-ascii?Q?KJyUAs9c71rYRcKsWtomBytVHH71CvyOB3yvLc1/ZSjXL6glTIpKNrOdyHt5?=
 =?us-ascii?Q?J65AHoAARp2Ep2rL2Y/GkXuSKJLx5ZbAdX8KsUy3byaF5WE7a43/ppvvM1kE?=
 =?us-ascii?Q?pL11nyWfarlCX7z8rP3I2NZw1QbU9P8BfYWkPBWQeEaCQY5K21mBrqlLs+BF?=
 =?us-ascii?Q?sNKJB75Pll23Le2NSZL7H7FV+EPcWK2AYfAcBCPNcfFibVYwJxc6ozjR9Ot1?=
 =?us-ascii?Q?AUiMzTQ7hRqjaD3kP1+tMJFWWDjeKc49aws3JGBXOUiHhW1ixTYdkBuZoSEk?=
 =?us-ascii?Q?hOofW/En7FAN3YzZuzv5B7CLpDTs2e/mU7WM7twr1uI7moGthdN7f86CkKRw?=
 =?us-ascii?Q?DydAZFQq2lm7lIHCO12hZCTBPCpRk/dezSa2ujRH3t6WrP1JaIlV77ptqrNL?=
 =?us-ascii?Q?pTWekC9UL3SC2XMGtsHnY8GGTqzlDf1iZB+XQD+UvhVjGlQEazfoQpaZJQr/?=
 =?us-ascii?Q?hJXbi+CBtAxcUL3t89mYSihAu+skDvEZPqRWzjCwN4T14x0cz0Aw4nEEWOHt?=
 =?us-ascii?Q?Wk+sdcSQtXn9y2sAj2p+dewNAMEJSQbxgVthar2Bx4vhTT8RQkCOH47vnvyY?=
 =?us-ascii?Q?GMiXaQQ+XfmLN/CawyTMoACHbUA092GG7P31FXemfVH1S29WH7v42/Z5qm78?=
 =?us-ascii?Q?FurQcte8m+dmc/eYckipcYJGoKbDXntJ/R1Awls2zzMQ/yZsud8/2QfNpIdk?=
 =?us-ascii?Q?zC/I7QdVtL8xuaNVtvAo8Uin49owCAHbWn/2k22c37F3nc0ehv6QFbubT8Fz?=
 =?us-ascii?Q?RLeOIRdKjiog2TCZIvLY/WGQzQ889D+2zRsw5M7kxYoO6ylnro8rbfUUFOlf?=
 =?us-ascii?Q?1DSkTA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(35042699022)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4dngVTX50w07hB+DhED906X0vOYjKPhtOEKNQu+EiLs8kK1ZhD7cW20K7QNC3fEyOspjTRwgiVpFVL+YSAUwEdUaHO7eesw3eBOLgR5hzmLajZT1PkeBBhwTGJmaYTOZcHqeRP8nicdyXLwXRDlQOO03QIp1t9BaUHnjsxIVYUwIcOCb8gQjdJji6d1yrMSxXgKP0osEiQQyEcguJnGuT+pHMaqgcg0+SCZakd5Uw6tXCPDm+5Ym8xHJGtPn7WDM0loPM/+TjbnT4w7zwWoRoeYIFaKM5RF66FoHpjLepgKQTs93Au12KCTXXNyeFT0uZfYBHyHqV3GxxHGLgJlnyscV3ZS5l1Qv5UtWdQD28aaQbmlZKst+TDR0s9mtGZQISCS0lNh1rVQruem+mfgMYdM7IwHhygbrxtv+R/3VtJS8X9ieXO9CrXNp6xziFLrT
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:56:17.4203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb1c8eb-5969-470c-23a4-08de705de8eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5774

Hi Demi,

> On 13 Feb 2026, at 20:45, Demi Marie Obenour <demiobenour@gmail.com> wrot=
e:
>
> On 2/13/26 08:52, Parav Pandit wrote:
>> Hi Bill,
>>
>>> From: Bill Mills <bill.mills@linaro.org>
>>> Sent: 26 January 2026 10:02 PM
>>>
>>> This series adds the virtio-msg transport layer.
>>>
>>> The individuals and organizations involved in this effort have had diff=
iculty in
>>> using the existing virtio-transports in various situations and desire t=
o add one
>>> more transport that performs its transport layer operations by sending =
and
>>> receiving messages.
>>>
>>> Implementations of virtio-msg will normally be done in multiple layers:
>>> * common / device level
>>> * bus level
>>>
>>> The common / device level defines the messages exchanged between the dr=
iver
>>> and a device. This common part should lead to a common driver holding m=
ost
>>> of the virtio specifics and can be shared by all virtio-msg bus impleme=
ntations.
>>> The kernel implementation in [3] shows this separation. As with other t=
ransport
>>> layers, virtio-msg should not require modifications to existing virtio =
device
>>> implementations (virtio-net, virtio-blk etc). The common / device level=
 is the
>>> main focus of this version of the patch series.
>>>
>>> The virtio-msg bus level implements the normal things a bus defines
>>> (enumeration, dma operations, etc) but also implements the message send=
 and
>>> receive operations. A number of bus implementations are envisioned,
>>> some of which will be reusable and general purpose. Other bus implement=
ations
>>> might be unique to a given situation, for example only used by a PCIe c=
ard
>>> and its driver.
>>>
>>> The standard bus messages are an effort to avoid different bus implemen=
tations
>>> doing the same thing in different ways for no good reason. However the
>>> different environments will require different things. Instead of trying=
 to
>>> anticipate all needs and provide something very abstract, we think
>>> implementation specific messages will be needed at the bus level. Over =
time,
>>> if we see similar messages across multiple bus implementations, we will=
 move to
>>> standardize a bus level message for that.
>>>
>>
>> I would review more, had first round of sparse review.
>> Please find few comments/questions below.
>>
>> 1. device number should be 32-bit in struct virtio_msg_header.
>> From SIOV_R2 experiences, we learnt that some uses have use case for mor=
e than 64k devices.
>> Also mapping PCI BDF wont be enough in 16-bits considering domain field.
>
> I recommend using a 64-bit or even 128-bit number.  This allows
> ensuring that device IDs are unique for the life of a VM or even
> globally, making reasoning about device identity simpler.

I will look into that but have a 128-bit number might introduce an header t=
o big for some environments
where the maximum message size is constrained (FF-A with direct message is =
constrained to 120 bytes,
use cases using an hardware messaging system might also be constrained) so =
i will dig a bit to see the
consequences.

Now preventing to reuse the device ID could definitely solve some potential=
 issues and apparently there
are also use cases with a great number of devices that we need to cover.

64-bit should be possible and i will check if we could have some provision =
for 128-bit.

Cheers
Bertrand


> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)<OpenPGP_0xB288B55FFF9C22C1.asc>


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
