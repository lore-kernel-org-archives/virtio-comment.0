Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DD13D7D66
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 15:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034767; cv=fail; b=Hu44ZNPgUdw6o+ML+qZ8EdWZjsswxR+Sn+IOdc5y66iTSYXMC4wQMWTlIN5XX6RQguGbbZNtQtHT+fDUALxfCh5AIIRia1E1SaLMVIGRHWLMyO350ahr/4jkJXY6tHDwtA6V2LuFxmC+LyO75mAsry0rJGkTHXijyVW0OpqtNe0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034767; c=relaxed/simple;
	bh=Kb7mgWCKezjYekvaQNbBWqMVEIs4gQaYDzXACH+SGRQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KyZ3u5dL//fm3DGWgQQlsrwyhnNzm1F8AJdAuburE2WKyAxwpRjtI1wj1hhuDg/QIy0r8hLIyMndUAPZvgjU2WDMTPRpIlkAQcRbFy/UZikfKFnzoU0TjTzj8LtSEN1ZhV7ZpmDOBvZJtVi9E8NuDgC9/RqjU6RdVY62S63znh4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MJF/wxLa; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MJF/wxLa; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MJF/wxLa";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MJF/wxLa"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mDRlGoppG3JyHixq5UGj6lDaaqozFORJGxSBijEVBATrzTIlRJGLwalTIPT5QOJPVrnFakNAtVu8JEWZ7ntm8voIVMYsxssjwJ2OmJwUDGw1/mhBzQalWHkIvQcADhNVni2Nafcqvwit/PQPMwjijlYz3mlcCG1Wq7dkpvEos6/u96P4P+KNIVi+HYCRIavl40kGfox3fw+OeQhHxVspQcu/VbKhhdQjOvJRhIcCCoPix1qosoPyJOiXuy+RK7Pbrmmu2qGgRpHWIcpl0HUSG7bZtsVjDnWm1aE56RWhH5caHXs4gBwOROteeUbMhdozVKf36a8m1fkpl69O8QODCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICq/s1Nb9D+wy83aiN9oa4kl1ej1iVHqwV26q6AgtMw=;
 b=Ph7tw3VAq2q1LM4rA9H+/IEmQ6J9LCCTzxTzyE0yKidiRY8jZOoJAA2oEodhVCUqNSmz90MZTtmUpjFqgo7unhNH9e+o/VPLUbY9gXSq/vHw46Tl7vnedSSKZLIlgMAbeGyw5etgbUBTRIlJZMb1+mtVgJf49MHk4wlco1Q9BBuhjizZ/wzqIr4IK44iGl/WiazD2H+hVv1MO4hPCOJ+Z/TwXFsqrMRLkCp2wcbHgNHeRhdNklIJ9bEle/NyQXdX9uFqZ0OMfDJSEdxoi+7qfPtE4dSPjmHrIXsVSnj6QSZMVIC0jEDngYNhLbcc70PM6TImhIWiV9g87zyFDTenhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICq/s1Nb9D+wy83aiN9oa4kl1ej1iVHqwV26q6AgtMw=;
 b=MJF/wxLaqtvy8sG5ttKiZA8WQN3LA/JijxRHX71bcy61UOBXuIZhlnbSi6nnfUM3pvnHP4VYepO5Ch2lIoiyaDjEn8KKAydlStITOwcHdqHrHAQp2mZeB3GWLQRHrSRc0+8XKKB6fB6BQsJ0EWX3OOKW6zDtB70m6xoPQ528zfE=
Received: from DU6P191CA0060.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::10)
 by PAWPR08MB10973.eurprd08.prod.outlook.com (2603:10a6:102:468::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 15:52:40 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::53) by DU6P191CA0060.outlook.office365.com
 (2603:10a6:10:53e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 15:52:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 15:52:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+/o/jImZKOUnwv7Ry20y54dxhdyrxB2AjdkEoHAwCOELLY2nwFtn6vc79T4oUx/xfX1a8j1x8lZG87J5gLObfdvH08YKlEmdvgzGWNr96IXJthikSKkw5IrBJupDrJj9BvKoS51kLSMVPWakmimUh5mkTNtGHLjEVh65eenvPnMOT7g48bTdX9vn1a+MX2AAZebKrujwE0uhukk4/VbNESM522a1tp20z10iIIKCuEFt/FF6Zl0f+inZyBdnIrP9Va9M6a0qeCYo6LAZzMlnN8tE5k4Cs8bDtdWPie2WUpPIL3C8GMZbDw5lyCAJCAnv49GpOHqGi3QjMzQ6ceuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICq/s1Nb9D+wy83aiN9oa4kl1ej1iVHqwV26q6AgtMw=;
 b=u3iyQzzK/kJAD8MPv7q82kxIQeny3aCPS6sKLD9Ye7UXVG3PHgF/pNsHPt13R/qXs1h4Ty0Qq+WZXHvFYLi29J8SC0gruSPzcZ1PhWsqqxZViHp51vq0cc2ahiV/ae7X6wBRRRnLhC2SgG5QXWJOFD4qflPcTJqitXfcWJg0XMjzERN9K0OGudDYCGJ0/Mjiqf3x2OxAfxeIrxazkTZ84nP2s49VOMfxWgaEavYu9Jh5GX8UEaxDJsRUaCBDrWW9eR4F2RFzMUGZTigrWblb15JStC2NXLNUP7IGHM3fuqbFWauz0jOfteNejZrX3ChEQ+SPidziwQ98f4awaKV32w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICq/s1Nb9D+wy83aiN9oa4kl1ej1iVHqwV26q6AgtMw=;
 b=MJF/wxLaqtvy8sG5ttKiZA8WQN3LA/JijxRHX71bcy61UOBXuIZhlnbSi6nnfUM3pvnHP4VYepO5Ch2lIoiyaDjEn8KKAydlStITOwcHdqHrHAQp2mZeB3GWLQRHrSRc0+8XKKB6fB6BQsJ0EWX3OOKW6zDtB70m6xoPQ528zfE=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV1PR08MB7756.eurprd08.prod.outlook.com (2603:10a6:150:57::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 15:51:35 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 15:51:35 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Manivannan Sadhasivam <mani@kernel.org>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAALveAgAfGPgCAAAUZgIAAIl0AgAAFBQCAAAMOAIAARd+AgAABNQCAAAEXAIAAAdKAgAACEACAAAE1gIAABuSAgAABF4CAAAI9AIAAAMqA
Date: Wed, 25 Feb 2026 15:51:35 +0000
Message-ID: <90C15274-2C9F-42BE-9D2D-668D9E985707@arm.com>
References:
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <SJ0PR12MB6806151DD9BF3AEF3839FB62DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <E24A071C-02D3-4465-99A9-732FB4EF49B7@arm.com>
 <89d13644-04ac-4057-b197-a6efe5e82ef6@gmail.com>
 <238DE205-5A87-484A-A68A-F3312B22AD6D@arm.com>
 <4fa96890-62a6-42f3-965b-6e229f6f668e@gmail.com>
In-Reply-To: <4fa96890-62a6-42f3-965b-6e229f6f668e@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV1PR08MB7756:EE_|DB5PEPF00014B99:EE_|PAWPR08MB10973:EE_
X-MS-Office365-Filtering-Correlation-Id: e20057af-60f6-482e-8497-08de7485e7d7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 x5f9ngOPUl4K/UOQwPc/IlBtJ+QiDhUSLoHL3PxDmTFavyA41/NcdMVVC/grZxbJGRHkKWX/HrosjY1cn9HLtfPZ9bjMQggqbC09/tCBHssokEjLuxMSMB2uzukmTDnOdd3TTjIKAaBvWB52/4D5gjTWL5DQhLPEJb3vyj6SS6ejruzzNeoQA0sMO7P163hvOSpMejIkFIQ+PWnHuNJjn/p/2N6M7wzgGRyPTMQnGBWEDA2hYRjUOzJSkiANvVUJE0vzFV05FtzTvXT4e6AQYOjUiQpkU/rVOQdUlyeVkWTingkjhkPeMCuUsJeiuovWE3Lab5rziV40O7sVkB/mguSZw/Jio2/DK0rK3TyCv55kwPKC1zhcdtUEALynmfKGhknvU9fZxfabDIrqPt9grzN1g67a86kDJe9+wQ1JgLtfbq+FyX1Pv4f6LWTsjwYm+DJkwde5Iq5iKEzVPXV1cwN+/gZnDsmSJGd6if4GekrMzGB4Mxb3Rbf7IHa2mRfFPw96aNaAU7AFxZfSirdezIEVbwLmKwNd/K2Mnwb3idRNBcLLnxDo+XLXBFo3iBLmC1Bhs4cRZFrXIb0emdGgBMTCcilldF9QHb0ucju/JVEQIa+EVYsgcKak68RPm9no5e6lEiDbexddiC7cInbFR68I/Re0+h28lBGfybG9pVymUeXDjlqrHVYT5MTUAYJQcwiLWaSJrQeTimyZiQZZ3rdbREagPaAr5QoIBezsUd0dFVVUkee5Sb3m+a/pfXLYzP4xF//HTEvBirKZdPTnPfu6LLnScTLnOSSB98HbbAM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <08A6B42B8E9E2247822C2C284757D3C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7756
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0753b918-42f8-4db5-23a3-08de7485c125
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|14060799003|1800799024|36860700013|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	WOEdQAnRoNNfl4a+eCC7H0DJxhy8/hFkLWRmRCIXvQew4pi8pVOCII94EmzAwxN5e5v1uSkRiTXAYIQZh66w3E5AAD+xqXMW1bwn/ebLFJ7ZViPrzrkKeICnjC0gkPZOtKhZPmO8ktqV6sAg8dveYnPRsfFMiZudwixPjweVpp77CuBLdDBX3YKCku19P8lkXA1ENZaCvFMS0YN8UWA5vNSw3G+Aw9afsKSVLJznkIonlXObxHmmbda9R/9u8vvKVvRMXx5UFmv7r7qEBqo7FgrPW4oQIraCe+mjeqPwUz7AOklsTk5ddu9juM11cmRU4KnydgqPOiOUCXehQblXVWpUj7dLHSCZ39M2cELyj456GTC3LirfxiKN5dw4fQ5yM5G64ooCP9YQjEGBm55GFpV0/W2KJsNsOiHwl65DuMIG7v0URBuOpmjNOE2tN/lQdP8FLvd0pAnKe7dv5uaMsbJvUhH6OIIBBwiJGNGjzv8Y+ha/lfaf0f5mS5Yaw6g5+8+crLSQfZCpZ8wQFB4ZfKcsr2EatM1oyTM4gUV6Ucv2orr/W656JNYydY1cQht7ARI6c94RgkKZGBsIYzk4d82jkhlG1ycneooNj58Oa1j+srIeREdpoIB2x8fNr3lmZsbVW0CRIOwGQ6lr6PQwAmYECJSacmjMJyvYPkl6037h09DHYbWrrA7qp56k2sOHcjVjbGaQj5NPAD3xQpOzN/KN0+ic0oymu2Zp9l8ewF5M9etWf1msTglU45oMs91/t9z9f7XZ+kP7V45JWjtR9qGSS+0oLUrg4BzHLoSTph0X2oUfvnqOVmOjVkvc6Zjd8rXEN7DW3qFv6Thg1pa10A==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(14060799003)(1800799024)(36860700013)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rE8WYOdi4tvIaBOzX9lBtTe5LwEDpuqZb//M3nWfdDMLRLzLWYpgCs6XNAU0dNHGQSqcKBeYjGpzKnB3AmrqfH1jsafofju5VXsSviBipYh90STwI5W59EwUNwAo86H4yKSxJ9n1HS6h05D3tXY4E8MisDwZB1sCnfv8luG1Qf9+lRO96E4EDUKTFa0QwERxUvOR26WUrasX+dDbkaWOriL2K6Tyzg7NcevUZBWwXme7esuTJyVnr9h+CiY1HKYgvNNOO58pufnn/UMLpOEZ/6chnNJiv7t5PTGcv0b/QslIImaIqBQ2OjsHNcLO/1D9vMJIU8dGk9ChUBm7uTk5LTMwirV6J3xvNVIcTYek41Vg+l6siPXH4Xhgt0qr9qSv4N9rZLiNHHk8Ek6WfhIiDdEId+4uSXh2dktHMC21MoYzndfY6BoaXel71KyNOo7Q
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 15:52:40.1331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e20057af-60f6-482e-8497-08de7485e7d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10973



> On 25 Feb 2026, at 16:48, Demi Marie Obenour <demiobenour@gmail.com> wrot=
e:
>
> On 2/25/26 10:40, Bertrand Marquis wrote:
>>
>>
>>> On 25 Feb 2026, at 16:36, Demi Marie Obenour <demiobenour@gmail.com> wr=
ote:
>>>
>>> On 2/25/26 10:12, Bertrand Marquis wrote:
>>>> Hi Parav,
>>>>
>>>>> On 25 Feb 2026, at 16:07, Parav Pandit <parav@nvidia.com> wrote:
>>>>>
>>>>> Hi Bertrand,
>>>>>
>>>>>> From: Parav Pandit <parav@nvidia.com>
>>>>>> Sent: 25 February 2026 08:30 PM
>>>>>
>>>>> [..]
>>>>>>>>>> So the PCI device is not one virtio device but one bus behind wh=
ich there can be many devices.
>>>>>>>>>>
>>>>>>>>>> Is this making the concept a bit clearer ?
>>>>>>>>>>
>>>>>>>>> Yes. This makes a lot of sense now.
>>>>>>>>>
>>>>>>>>> This is a virtio-msg-transport device that needs its own device i=
d in the table.
>>>>>>>>> And its binding to the PCI transport.
>>>>>>>>
>>>>>>>> ok. how about an rfc of that idea on the list?
>>>>>>>
>>>>>>>
>>>>>>> I will let Edgar answer on this.
>>>>>>>
>>>>>> Sure.
>>>>>> Also please explain how is this different than SR-IOV devices?
>>>>>> On a PCI device there are some child devices exposed using some virt=
io-msg bus transport.
>>>>>> And all of them are going to share same PCI BDF.
>>>>>> These individual devices cannot be mapped to different VMs (secure o=
r regular) in a performant way either.
>>>>>> So what would this virtio-msg-transport device achieve?
>>>>>>
>>>>>> If there was no PCI bus when implementing the virtio-msg transport, =
it would make sense to avoid trap-emulate story.
>>>>>> But underlying transport being PCI, its back to square one for the o=
riginally described motivation.
>>>>>
>>>>> If the objective of the virtio-msg layer is to really support FF-A or=
 similar other non-PCI transports, lets please focus the discussion on such=
 use case and binding of that specific non-PCI bus. (like the link you poin=
ted on arm site).
>>>>>
>>>>> This would help this series to progress faster without getting distra=
cted on PCI side.
>>>>
>>>> Agree the example of virtio-msg over PCI made the discussion divert a =
bit.
>>>>
>>>> Maybe focusing on use cases like:
>>>> - FF-A
>>>> - messaging unit + shared memory
>>>> - hypervisor based events + shared memory
>>>
>>> Is "hypervisor based events + shared memory" only really intended for
>>> Xen and other true type-1 hypervisors?  Should KVM and other type-2
>>> hypervisors use a different approach, like virtio-vhost-user?
>>
>> Well there is definitely a use case in xen but any other type 1 or type =
2
>> hypervisor could benefit from using virtio-msg and have asynchronous
>> handling instead of a trap and emulate based implementation.
>
> Do irqfds and ioeventfds already provide this?  What interface should
> the device-implementing VM use to provide the device?  Should it be
> a new type of virtio device?  Should this be standardized?

There are 2 sides:
- virtio-msg support in qemu (working on that)
- your new virtio device/driver

Once the first point is available you can create a new device type if you n=
eed
or just reuse any existing ones (block, net, you name it) and build somethi=
ng
on top which is probably the easiest solution.

As said once the transport will be in linux and qemu, any existing virtio d=
river
will work and that is the same for virtio devices existing already in qemu.

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
