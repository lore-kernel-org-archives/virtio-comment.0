Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548E53A7F67
	for <virtio-comment@lists.linux.dev>; Tue, 24 Feb 2026 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949752; cv=fail; b=EWEy8GmP2Kzw9sxYDJE816sJhgLmFZczHqBJZsFP2C/i/2rABfg3dM/x4D84+JLzd3RCkImVwej4LblvCSoIr2AMLKMUyWE9p+dRgRa5V7iJSfOuInSdFNS9dwSTBRwyrYVV5wVXOfJ3uYHJ2X14oDNRcz7LRLmhXzuH7lwIBfc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949752; c=relaxed/simple;
	bh=bTuQaRszg2OlpgIzXaLDuI7RzOMIe75jFSLbe08e7Vs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zasiivfj9Ebp5IGkyUNEQVp9KZmTnZgQm6LrrqVFh75W7hegkNaQ3PDNJAU3hlTebjWToyMuM8Md8ZEo/EgyDynx7bUf6BhiRp/I7uppP5EX+RX1uEJGuPlUCzRO4tQyzfmEs6hfUD03SI1Sphidng1D9S81ScTeQEnJ3w77uF8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qnG6+Bg0; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qnG6+Bg0; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qnG6+Bg0";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qnG6+Bg0"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WZf/sKiXh31pIhh291735tyHD6hQKXlGbezwynQS4s783GaO7W5pyLxmV8uq23AbYC/EIaDWskn+8zNKK0AWK+vGkt0KhoMl3dydCc7ck2x26BXKpvhO8O8WWdSBeJ8KXUOI+7Iw+AXH88CD9dh3lLHkO6qC129GA2KWp9l4mzB9H3x1qqQO6XGuszOZBigRatmeQVXhXs+G1kz9Ql/9Lfj87UqGz/8zNAYQzPRzDy5wPr68Owmqb0L390jL67zwUeb5ZukPa2M8uHQsRJ50JYI4WqqkvbGkbTshNs8/3oI/WZWz4p8kbmQuBH8CID6gHgovdJaOodrYn+Z1nkEs0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm3qNBf4eZS2CXMPFJ7aM5GdME2/ES0HX7sPInj/jO4=;
 b=c3ZXX2bVkr1B3kJVLoDfh7HADSYc5IUIX2AHcDjBaKma6Huv1K2cbfH4MSlc8FDLsJ1lsI3uDNeoIxhfpMe7pliiAiJANFtocI/TXdoD+mJ7bQD1Gf3OYebzEGrOX/qq1UQR+zBXqUI2qxuKIzEcEh7NQFRLpqRd9Yw869WAYU9GyP9omTLY0FzN5M479cWWusR2qJW1mckuCMG3sINIk8JChvV71N0ICM8wR0+Wma9f8iQt/uX69yAuG6d96T5JPg0SC65AprWcDhiPWmf4ZrrjlH0EuzitA0Kw4pE1sTxTyv6qhuRgGNj2rAxy8s4BhPTnwbVEEFepZmMfz4b8ng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sm3qNBf4eZS2CXMPFJ7aM5GdME2/ES0HX7sPInj/jO4=;
 b=qnG6+Bg0+Zp1UIFW7rWq1B9WsOlqVUk10g1f8H764h4l3bnuK7NxSy1ShXqkmr7XrWMb81K273vqNS40nzD0DtS/xTF6rbBf4s0d49Jdf1irEPh00Y2rBeaJ0f06U2FNdmOCkFx9bT3iHDZyz45YZsjaTkWtdK+jqP3yy08o+e4=
Received: from DU2P250CA0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::16)
 by AS2PR08MB8384.eurprd08.prod.outlook.com (2603:10a6:20b:55b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:15:43 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::33) by DU2P250CA0011.outlook.office365.com
 (2603:10a6:10:231::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:15:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 24 Feb 2026 16:15:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=st3Qj6++2gNlqL+rRY6R45+TS8gqyLzgLn3Bh/T/tn/P0wOui1DjvWTjfp7gJI2j6THmuBzm/8ZegdWjAfCSoO0bmev4T0C3G11gUSzpxAVpOWJIhsb3acr03rmwY15Bj91xMFkGtcTBt7wKacZSOCUiGK20totmNyZcTGyxR8DTUYhQuHFeHDvmpcO+MmKZjcUrwvoBjckVOfjKqQwPSAtJyu7bFFCHN1kuScRi/9iFVWxhpFgsg+1fYeSl4VYe3/8gR5Q1R4+nR/f0ssAcMko0Z3n+W9ovK+mjKrAda+T68uc3mz+sdFzuqrlg46MbCasomMNblv3SVrvuI2xUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm3qNBf4eZS2CXMPFJ7aM5GdME2/ES0HX7sPInj/jO4=;
 b=W+bBRXy8kTZYjZJmVyCWuspJN0Q1YNTv3Qochnu/KoxhD1LGd8OqGMNkTYt6xed0DVBiZlTKLK+x1qH+TICro65Vy4gK6p7lV3Vw+gVLof//WtmaQUTQ8jzR7kR0AjFQlFVz+p9CkjUH2lSFxI0WtJxGwdacJDT4JTyERc+yjBH+xfbDt7fDR/w5ES/gXQc9O6xGyEFVJRs/DnT5qaMg1PSEX1FabHJ5tOSofl6qZjTzTpa5NclzKqLWYb0yfAZOTddCbu/Xmfs557uzjoUyVIDVGcv0dvqJnROxI42Dll6+Rj8aQ1uXoHEzodNj+20v+hB6Noj+3C1/YsfAYXp2cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sm3qNBf4eZS2CXMPFJ7aM5GdME2/ES0HX7sPInj/jO4=;
 b=qnG6+Bg0+Zp1UIFW7rWq1B9WsOlqVUk10g1f8H764h4l3bnuK7NxSy1ShXqkmr7XrWMb81K273vqNS40nzD0DtS/xTF6rbBf4s0d49Jdf1irEPh00Y2rBeaJ0f06U2FNdmOCkFx9bT3iHDZyz45YZsjaTkWtdK+jqP3yy08o+e4=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS4PR08MB7603.eurprd08.prod.outlook.com (2603:10a6:20b:4cd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:14:40 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:14:40 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>, Alyssa
 Ross <hi@alyssa.is>
Subject: Re: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
Thread-Topic: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Thread-Index: AQHcjuFmIzYveS1Rqkq8YyoL1D1kt7WSKnaAgAAJFYA=
Date: Tue, 24 Feb 2026 16:14:40 +0000
Message-ID: <5D592E56-7154-4324-BDAF-27F0ECDAB0BC@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
 <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
 <c0e37ee7-9631-4611-ace2-43609dc11ab2@gmail.com>
In-Reply-To: <c0e37ee7-9631-4611-ace2-43609dc11ab2@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS4PR08MB7603:EE_|DB1PEPF000509FA:EE_|AS2PR08MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff2efb0-c990-441b-7a86-08de73bff5d1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?BpKy1H0oRxUHc3wqD7RL8uVvN3AB4eDHzaGIotCyPkdTvkZo1cIspjKtPV0Q?=
 =?us-ascii?Q?aP8gFPOIwtCODm5v7uNuhdR5p7Hp4b7h2BLlq4rmeZGeyvilkOO+RWQAR1fu?=
 =?us-ascii?Q?ai93u0Q5BDDeWRXa4FRZXMRGyzt9KJqi369fB1qhU4MJuvN4EBhTFRtKAx0S?=
 =?us-ascii?Q?Pq03SpUwAV2HxEmXoKtJlg3HiGFqMVhpAT2lA1wl74h903L2v0JOJ/vNgjb5?=
 =?us-ascii?Q?OcRmCLDHHXtw5FwxNHtZbdmkjdPxoGcIq9zAqY/v8PKWb4NC8u7ReciGlD9j?=
 =?us-ascii?Q?72E1D0HvQdNnsdk/8/+nnvWP0s+Yp0oqPTCNHgENcmCEvR/8FWgKysAnHZzn?=
 =?us-ascii?Q?GAWrpkXVDFFwfKrs7b+jTBYTvuKbXn3sTf8nk8ZLHINflGHQCaOuuGslwjfA?=
 =?us-ascii?Q?ZEbPImF1OlBp99qiOxkn9N8p0Mdx9Y82sJEtUXwfR4xsnRhPE0jCXGKhg7I9?=
 =?us-ascii?Q?xbYVX9yQeSE9kGQLQwA5icrTzHa9h1/llPUQInDQnDJmbWdmBlLhGGEtAZdi?=
 =?us-ascii?Q?jtyaFWR6PR2vLZQUOTGD6v+XEtzlmf1vu1KmPYYIbDySmjvAScRtq23h4p6H?=
 =?us-ascii?Q?mGY/cpOIpGipbbH2SSGaxYPGw8HMnszkVfy+mL4a2g4nq59VWNA2+kxV035F?=
 =?us-ascii?Q?L5xS1AWxc7bkidqH4IXFypPG/ol90eT1VBb4xbfGWa4keq0UlST1CIVyTAiP?=
 =?us-ascii?Q?TSL7WFH/b/8z5kbjDqHNRj9pSnBRve8p1YAi64yvOhW+ftAW26LcQ4enxTOF?=
 =?us-ascii?Q?To6h/GoG57437ISVuhYb8vrl6L86owAhvGLvqVZyHF++9jNOGpvxL8Ts2JEE?=
 =?us-ascii?Q?uyhsQxjvTfW8docfFPxV3/uknmPG0EQXGeNjJ1eqZbt1T7YiRFNaPMYPiK2f?=
 =?us-ascii?Q?g1FMYtP9ZOrIUF7pE97ZjJpFvsCPSTbzPXWb847qWNiDXbDtvZCoZootX96i?=
 =?us-ascii?Q?z6rMcLMAzkJAdF9bYu6wqOR+DEKxxr+InU17EW9PCE+K+BWm33gd6v+yXohL?=
 =?us-ascii?Q?ctC17UrDAFGz9ZljXT2FGawb47lgWZkwULIcml4ubVtS++NQtqy1BKB0//MG?=
 =?us-ascii?Q?9jmZL119dIr6m49/Vkax2d/b2FuEbnVWRr3DPpLOtb+vpq91ed9gh+ZpVE2B?=
 =?us-ascii?Q?VkvBXPSB1MoDLlkj0LYI/v6TJxpXyrGPIJZSkUeeJVDlqk3lcmvKQQFEVQ+u?=
 =?us-ascii?Q?JQ7fZ6yfSI52IoKF/RFbL7kDIzIM12hGfF4Bin5rLPsda7W76Uj0u1tqhZAP?=
 =?us-ascii?Q?wFV7xyQgfaz2rvtsVsRZyn56kkxtKH/+lpoLro1X+1krJ3EQw4o/OwUM3zdf?=
 =?us-ascii?Q?d0aKH7f4KclRMb2utX+jzO3reughMe3tMyAsgwgDq0V9ZbWhGcbxPm+WiwUz?=
 =?us-ascii?Q?CD+By135xD8QghrAdwZ+RsczDw9WpxK84CsGaS6idChx+dWT8tFZiXDNoUVX?=
 =?us-ascii?Q?HEVjs4m5PzyNRymurMimZgnbieQP/zk/faA+N5qyCbiYIOHrf7vxvfbQERgq?=
 =?us-ascii?Q?nn5u6OOun03lfyIb/vUHsz6LCxJYQwnxHyvW2StcUVgnT9Vifkuyxpq6gJ7r?=
 =?us-ascii?Q?cQS3rjeeCwjIlIwfwIJDNsmcqcdVqVXKTkCVUrWi6p82WZx+A1ZcURwVMzi0?=
 =?us-ascii?Q?6DRQQrdvDtqpBM9FdWNWcotsB558+SDxyToSlkgF5gFX?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ADED77CA38277C429A4703940DD36CAA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7603
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3caa3772-6099-43af-55ae-08de73bfd025
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DiAXV77FP2+PmbJzrhw1TalDZx3KNYWoAD77qYTbpSpr5vXtRPLCHcpFZSTT?=
 =?us-ascii?Q?ZoaCMTntDSYjhvWF0rQWe1KZkSEAym5c0LApnzRAWxAludmNHMDmtHnh0R4v?=
 =?us-ascii?Q?b082XADkuYkIIuo0jmk0U8119EEtOPVVqh4x8hjm2jLndnzAlm2Yv6pPInbr?=
 =?us-ascii?Q?pl5eRxLbIZdVV51SWfqUUSEwUGXQR4C6YkFGDmZxBnt7fB44aqVMySWf211u?=
 =?us-ascii?Q?p6nBjIgidsrO2BaMGlSFCGV4VhHZ/PtTiA9qZeUhnxB+dq3QNhOye8ianYx9?=
 =?us-ascii?Q?mF+eNREEo1R94EbWucd6f1fD7MgmzXAfISn+lTU+Z3Q8c6RcEi9ojuaAuduQ?=
 =?us-ascii?Q?0YkuOxoGGmVUBAs0T0RAjyFz3WyN6Nim0uaw69jCJgkl9aqdkrXa6UTbGrL/?=
 =?us-ascii?Q?NDFAGgekpvAHcflydvppq+WwpnUhJBNV5ppJZLUtvg9+1ifYxFqtqFPDUSOE?=
 =?us-ascii?Q?pkbw+w7/O+pKYliZfdSkJsWKZju8AokDKXQD87CkbwdB6pEgmu3c81IHLia1?=
 =?us-ascii?Q?eCToAf9w8Wo1kO80mJi9aj+7PGfA8JVAqcX8MdahGdQJy9/yoom7n/WvBNKe?=
 =?us-ascii?Q?YSdCuOUmnokWdSgBjkZPcFau8q0/NDM1Rz6BwU5gaFNfj+46oDcCRFiUAw3S?=
 =?us-ascii?Q?IVexKl8g8/3gmo65e3D9mwIcbkc61XnDapfUB1lqhtpFZJgJMTEU8nyZ2Qw5?=
 =?us-ascii?Q?jtS8HF69oPDnrl9CamK3q/TCFRJJYybRM3CbH2oiZkqySR1qdCQwm4TXabBS?=
 =?us-ascii?Q?ldniNAhjrxPekoAK0UztnmIDK40ohLyV6+k6CNrxW27GP1iLvOxq7KLys2UX?=
 =?us-ascii?Q?777FVCndqHhV0H3cdWmk/AxQs9mkDRRGuWatYU32n1GuOQYWsHgqjxO6dRwL?=
 =?us-ascii?Q?rFdeirI5LnDzgPXVD15cXUCkhUNN9o8eekO1kYtX8GCddqp6WCeHiA1T2L0w?=
 =?us-ascii?Q?E/eF9/YKW4B1QaEPhVhKyfz/jLEFkCEAZNIH0vPD1e0W3dmlil+mM9QFcqmY?=
 =?us-ascii?Q?7cCer1//WAnibgeDYDgLLd/11Wwnz4dzIiCM8ENqysCK7ZpSl/ledRdX2mot?=
 =?us-ascii?Q?IssBRbPKB92JUUoNwY4YahiZwwvvJ9oiyZtwoIvEOwWt7ZF0kORz0wCqBkVu?=
 =?us-ascii?Q?dkA6wMlMyRvIRd3o+lItkcAyzM26t03uX28GhVROtCHrhL7flVgDxQqn6dcu?=
 =?us-ascii?Q?Qfoib10k4Px+bxQfxx2FnEwGiVsvL0T2lOizmd6Wv79b9JXMj/t11Bb5y06t?=
 =?us-ascii?Q?AnGyH3TYXIRgW5grsCIJkqhhsqAbax9YLr2kEeKAVGxhCqzoawGn9/h3RNAg?=
 =?us-ascii?Q?cEB1h23oYVQ5T6zVkfj/JVB3xy5QKwT+OUrfeYm1WoLqkf/uYRlAdkBRDe/Z?=
 =?us-ascii?Q?7pCdiFfJvhsyK1RBm7f3GlbUQsEDwvhUMd/u1p2/JGpbbCYSaBrWBBqoYlNe?=
 =?us-ascii?Q?tGHteUnQ9/RO/+jduGqmmWjGFMgBHh6e+NnDGYv+Hdx5Ia00e8BfjVsWgOWi?=
 =?us-ascii?Q?eWL6AFdhmS5TxQPdmiPAU/5OfFtWAo38nvn1e/RbPamZdRBT4talJqdxVnta?=
 =?us-ascii?Q?EP4b5jvpD082kvoWzMaoTiyn0ej+jNm2/zO8inRJ39Unj7ZfHGVW04xxxyQq?=
 =?us-ascii?Q?N0eabZMifM9vXruMo89rmTk+qX88BLpOct+0UyZBpf6ZAFA4siqQHvoiQOP8?=
 =?us-ascii?Q?NEAmwO8EroV/HaxO3WqPHb+/KJ4=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TzmCJR/ooCI8DiksUJ4J9+hbC7EOH8p7i1J0ffsEQVl5Hj6GUl34PomD1Wga/FHMYyPCVJXIbz6P/fujx0TykhUwlr+747X8+Wb0669A3QSBf8QJzg8Doe3NnxBsgMthcab4osiKKfEEAajJVx0CwfsHwg9ul3zR5TKpMYWkzmM9T4Wngf4eMlmn9u9wJANEtIUdiEpgzhGFIM+0jmd+QoB7pcm3Kr+CTQ7o90Rf/pbAkJ+FTIqfB1/dKyd/vGvDelqcy0awENHRpL0NNvs05s9qSIMXhjuJ6RR2c5wagy3AMCUp0kC+48lNspaxhHyCAKmXIweAkjDcEHh1GmUxVe3RORwBdy9nGXPNUTrdwY7t8GEl3i4hDCNYCYtpftRaQoN5wTJYEV3E5WXqZ0RQ59uKXatMDV7Rvbx6iUM6FVns3VRuQJSJPQ3PbcY2HqKz
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:15:43.2210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff2efb0-c990-441b-7a86-08de73bff5d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8384

Hi Demi,

> On 24 Feb 2026, at 16:41, Demi Marie Obenour <demiobenour@gmail.com> wrot=
e:
>
> On 1/26/26 11:32, Bill Mills wrote:
>> Add a new transport layer that is based on messages.
>>
>> This transport layer still uses virtqueues as the other transport layers=
 do
>> but implements transport layer operations by sending and receiving messa=
ges
>> instead of the "MMR" reads and writes used in virtio-mmio and virtio-pci=
.
>>
>> This transport is useful when the device and driver are both implemented=
 in
>> software but the trap and emulate operations of virtio-mmio and virtio-p=
ci
>> can not be used.
>
> Is it possible to map a virtio-mmio or virtio-pci device to virtio-msg?
> For instance, can a VMM present a virtio-mmio or virtio-pci device
> to its VM, while using virtio-msg to communicate with its backend?

I am not sure to understand what you mean here.

Right now a VMM would present a virtio device which will behave
the same on mmio, pci or virtio-msg.
In our transport implementation in Linux, we did not change anything
in the virtio drivers.

So the transport used is transparent even to the virtio driver on top.

>
>> This transport is intended to be used in many situations, including:
>> * between a host processor and its co-processors
>> * between two different systems (not SMP) connected via PCIe
>> * between normal and secure worlds
>> * host to vm
>
> How does this map to the vhost-user protocol [1]?  Vhost-user is a very
> common way to implement devices and it would be nice for virtio-msg
> to cleanly map to it.  Requiring a separate AF_UNIX transport could
> be quite disruptive.
>
> [1]: https://www.qemu.org/docs/master/interop/vhost-user.html

This is something i will need to look at to provide an answer but
vsock works for sure so this should to but I will have to confirm.

>
>> * vm to vm
>
> This requires a method for VMs to implement devices, not just drivers.
> For Xen and FF-A this is easy, provided that there is an out-of-band
> means to enumerate which devices should be implemented.  However,
> these mechanisms are not hypervisor-agnostic.

For FF-A the way to enumerate devices is hypervisor agnostic as we have
extra messages in the bus to do so.

I started to research how to do a xen implementation (using only grant tabl=
es
and xen events) which will use a FIFO in one or two pages shared using
grant tables to transfer the messages and enumeration should work the
same way as with FF-A.

>
> It would be much better to have a standard virtio device that backends
> could use to implement virtio-msg devices.  There have been multiple
> attempts at a virtio vhost-user device backend [2], but it was never
> widely deployed.

What I am looking at right now is the following in linux:
- virtio-msg bus backend implemented in the kernel with a standard
virtio-msg bus interface to user
- virtio-msg transport backend implemented in Qemu (or any other VMM)
communicating with bus using a kernel interface

This makes Qemu bus agnostic and allows to have more implementations
of different busses using kernel drivers without changing Qemu.

Having something of a vhost-user backend seems feasible but would need
some work definitely.

>
> [2]: https://uk01.z.antigena.com/l/RPtFHkpliiy7NRgNtyaO30yBQpiAnIuLVyzAK2=
QZ0fGEIjSJVGx5Mu3MwXXt-LgQn2ZVpDwK1wfUHdgKxzrauRK4sFfiVoW3xPL5PablM52jV-ngF=
4DwusMzPUNSF6WQ1Ec3WMxworPUgzNgc1gDTMsD1H17lnI6v1cOcD1m5vAuK4eS7Ma8l5f5Hhci=
CHG0H4ibv8wtWquW2fvs6m
>
>> Signed-off-by: Bill Mills <bill.mills@linaro.org>
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 1640 insertions(+)
>> create mode 100644 transport-msg.tex
>>
>> diff --git a/transport-msg.tex b/transport-msg.tex
>> new file mode 100644
>> index 0000000..d4e31d7
>> --- /dev/null
>> +++ b/transport-msg.tex
>> @@ -0,0 +1,1640 @@
>> +\section{Virtio Over Messages}\label{sec:Virtio Transport Options / Vir=
tio Over Messages}
>> +
>> +\newcommand{\conceptref}[1]{\hyperref[sec:Virtio Transport Options / Vi=
rtio Over Messages / Basic Concepts / #1]{#1}}
>> +\newcommand{\msgref}[1]{\hyperref[sec:Virtio Transport Options / Virtio=
 Over Messages / Transport Messages / VIRTIO_MSG_#1]{VIRTIO_MSG_#1}}
>> +\newcommand{\busref}[1]{\hyperref[sec:Virtio Transport Options / Virtio=
 Over Messages / Bus Messages / BUS_MSG_#1]{BUS_MSG_#1}}
>> +\newcommand{\msgdef}[1]{\subsubsection{VIRTIO_MSG_#1}\label{sec:Virtio =
Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_=
#1}}
>> +\newcommand{\busdef}[1]{\subsubsection{BUS_MSG_#1}\label{sec:Virtio Tra=
nsport Options / Virtio Over Messages / Bus Messages / BUS_MSG_#1}}
>> +
>> +This section defines \textbf{virtio-msg}, a transport mechanism that en=
capsulates
>> +virtio operations as discrete message exchanges rather than relying on =
PCI or
>> +memory-mapped I/O regions. It separates bus-level functionality (e.g., =
device
>> +enumeration, hotplug events) from device-specific operations (e.g., fea=
ture
>> +negotiation, virtqueue setup), ensuring that a single, generic transpor=
t layer
>> +can be reused across multiple bus implementations.
>> +
>> +virtio-msg addresses several key objectives:
>> +
>> +\begin{itemize}
>> +  \item \textbf{Support multiple bus implementations:}
>> +  Systems can rely on various communication methods such as hypercalls,=
 local
>> +  IPC, network channels, or device trees for enumerating devices. virti=
o-msg
>> +  defines a common transport interface suitable for any of these mechan=
isms.
>> +
>> +  \item \textbf{Reduce per-bus complexity:}
>> +  Buses can implement a fully message-based workflow (including optiona=
l
>> +  enumeration via \busref{GET_DEVICES} and hotplug via \busref{EVENT_DE=
VICE})
>> +  or they can discover and manage devices through
>> +  alternative means such as platform firmware data. In either case, the=
y
>> +  forward transport messages to and from each device.
>> +
>> +  \item \textbf{Preserve virtio semantics:}
>> +  The transport leverages standard virtio concepts (features, configura=
tion
>> +  space, virtqueues), so existing virtio drivers and device implementat=
ions can
>> +  integrate smoothly once a device is discovered and registered.
>> +\end{itemize}
>
> I see that there is support for device enumeration by drivers.
> What about driver enumeration by devices?  An FF-A endpoint or Xen VM
> needs to know which devices it should implement.  In embedded systems,
> this can be obtained from the device tree or ACPI.  However, dynamic
> systems need to create and destroy devices at runtime.

For now on this would work as it works right now for xen pv devices or virt=
io devices,
you will start a qemu telling it which devices to create and those will be =
detected using
the normal device enumeration message (or hotplugged if created after boot)=
. This is
why we add the message to signal that a device was added or removed.

Cheers
Bertrand

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> <OpenPGP_0xB288B55FFF9C22C1.asc>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
