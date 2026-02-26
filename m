Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DB238BF7D
	for <virtio-comment@lists.linux.dev>; Thu, 26 Feb 2026 07:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.40
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089573; cv=fail; b=askMR852xbiTneSz9H6K5xKbJv4iEN0W6tP11uZLnb4B4mfwGMUqc02QzZ1uuFEkZVbsSGVEPhVr8KndNCCLIBMO4KvBA7tL27lBYcsD9UUfDOn6VL60+qkACN08mD63FWVE22KehKWdreu2tOJ1e3Slk0Qq0ca1kUpTah371a4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089573; c=relaxed/simple;
	bh=H3SagpDWCqT43nIaDIT0TEdz8zLtwVb/XfZTcdb6bsw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tXSdtJI3+OMVSoAwz9TX7ZLcshZwtX212oKsoHdHwbnAlPfNDJPlDpkvdZrn/AjU9NrbBZEzWGM+fJ+GcTXLIs0w1YkRGfMW4vHVU6ruYirERcvvyu3O9H9KKJhhqg000H3wfXJoPrAIbCu+kQj94cNZEg4ATzLi5QDKobGMr0o=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NUPpu/Wk; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NUPpu/Wk; arc=fail smtp.client-ip=52.101.84.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NUPpu/Wk";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NUPpu/Wk"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TWvshH8ZPChN42EHIzRKZsgV9rR3UYjQd1I3ooK68W1tNYVcsLPwPhw2u4mx517MgKETZ62wf22ir66OyUH6t3nNEymqcmW+Vlr+vT258+aaPjVR/1Zxu3fzI3K0p5TZ7PvsyTvpBj3pdTzkx5lL0N3qAjXo6kiipH5mBRyQ4D3++RPNDtp+zR7cDRoCWKL67we9AsdREeqPpLG75hn+HpqEVcDbo9trGUSmwWh4HaQRaEzkJCcyoXf+qX42Y3+VEOu7eNpXs9LudVWEY07eXDiX2KnbKP3+gp6CA7OOKxQrFdwoxqWx/5O6LAk5qXIW68YUqtfvSTCL3QkicIwJVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3SagpDWCqT43nIaDIT0TEdz8zLtwVb/XfZTcdb6bsw=;
 b=n/qWxbzjjsHPG5JMmI+1tCJwRBpCTYEUezbTGIb4s0dGIa/e/dKPG1eylYQgCVyFZOtg7bzDFxuKE77/DT692I4onbdLInn7VamGKjcn/YDWIoyRO59mbcB1BQ02Hdz53ZVD2hAoU0rXRKYZxCx3v6ef4GJRiACPYudR91GSw7PycYM4pxJopQ8YuFZ3U8YzkVmrQUiPaN0lX5VVQ5G8KnwNqRpGw8zkJ9ORdIgk/NWQJx5gcssv/VEQ7O2WTtPtjVZi9U/puEMjqoGkeYo1o4VTVx9fpwHNmiSlPR/n4iGvPZZ1ZsMYPKwBxT3h/tihmu9Kvw0XiEq96nAvJGrd0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3SagpDWCqT43nIaDIT0TEdz8zLtwVb/XfZTcdb6bsw=;
 b=NUPpu/Wkbtw/owl4zzY2U8BRI98OinbKUslnjFrk48HtvSnn6BYBilHYh+Q1yKUi+S6+mdsI9Ee+GpiSedCmMxwN1r+omMnSwSTndB2pCxKf6a8XO9S9x/DZ7wodeKYKi4uBINt4p7mTijc7jySeqFiLTJD9iV/RwMrF19KkVTc=
Received: from AS4P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::7)
 by AS4PR08MB7808.eurprd08.prod.outlook.com (2603:10a6:20b:51b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 07:06:06 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::4e) by AS4P195CA0007.outlook.office365.com
 (2603:10a6:20b:5e2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 07:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 07:06:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCIDoFCdEqEt15590VzyH094zloVP3LAQ98qPcsH2z5AIlINfcCrVLJymjljMOj1Pm6JcSIbDPvKSCHGesl3d55lt7+uDiNXa4X9hhrikuJQDT6zL3GMbckR9URYK/A+m7cIr6VdsIFc89QUskVHQlpSMe/KKoQ9vm5Edo6wFx9UwDObbe4FH1lRFjhqhOTy4D5e8FjLRsgYvfMYAP375PmxHrNitxDpgVFFREYdd8KMIIbvhf3LFRA5DAiDpZp9AAeqcgzmtff67Vp7SwQZ5kzKrmTWiZ4N3o0JaPDKynogfe2DS+7nLyrY1D50wLRdhdH+nNNhVdRZshkUM6iD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3SagpDWCqT43nIaDIT0TEdz8zLtwVb/XfZTcdb6bsw=;
 b=XzY5pNCKl1cm0YnO0sp/9A78jOevXsX6PWftEuh2c2uhYQemosEfsswLK6/TyHd6ZozJAlFDqalG06rzJd9oqmKhP916uIwv6cQNYBi39cRXmp2eCwgrW6SXydLAq9MMYvFeF7EZZ3QJ/iJaayzfMDA/jgUoWOftqPv/GmhJ5VsjZmwCBW668+dGgxvCSWGS39H0iLGheUCMngjPwEU35LXGEY9HGdke8ddv6RZjkEIspgNsKwFU1e6bh4OMfLyi/oveq0851T/vhNMT3xwNEAmlQAuXdl3G5S7FDZ3KXkvT9l/9eHeWFdczhcUk889odMMFwnMtUCH1ctzRiADucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3SagpDWCqT43nIaDIT0TEdz8zLtwVb/XfZTcdb6bsw=;
 b=NUPpu/Wkbtw/owl4zzY2U8BRI98OinbKUslnjFrk48HtvSnn6BYBilHYh+Q1yKUi+S6+mdsI9Ee+GpiSedCmMxwN1r+omMnSwSTndB2pCxKf6a8XO9S9x/DZ7wodeKYKi4uBINt4p7mTijc7jySeqFiLTJD9iV/RwMrF19KkVTc=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB9534.eurprd08.prod.outlook.com (2603:10a6:10:44e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 07:05:02 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 07:05:02 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAALveAgAfGPgCAAAUZgIAAIl0AgAAFBQCAAAMOAIAARd+AgAABNQCAAAEXAIAAAdKAgAACEACAAAE1gIAA8rSAgAAXhQA=
Date: Thu, 26 Feb 2026 07:05:02 +0000
Message-ID: <1F211C1B-C068-4B13-A01C-220681631D3A@arm.com>
References: <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <SJ0PR12MB6806151DD9BF3AEF3839FB62DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <E24A071C-02D3-4465-99A9-732FB4EF49B7@arm.com>
 <fvwk5w52h2txthli74zcm3czef4ilk7fvydkle2fdof7u662gn@yhqgw4hte3oi>
In-Reply-To: <fvwk5w52h2txthli74zcm3czef4ilk7fvydkle2fdof7u662gn@yhqgw4hte3oi>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB9534:EE_|AMS0EPF000001AA:EE_|AS4PR08MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 062d75b7-8761-40f5-edd3-08de75058259
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 6rN+CXUTnjcNO6zRhmmcL0gZV0EK0GORA5ZX+WGzDCKokKD5JngNgM9rKWuVr8gSrmbChh50h2WFVZS6+Lc7tAArvJBGBDsW4FdqTK3ajfXhhXRxLMEL7Vy5He5raMAGa/V3eP1OEeYXBWL8tdEaK3IhBKctfkBIKIy4L52EVIICzREk2P2JgZx2ii8sPkP9aA5RU/jLEOdU4X+5tuQOi83+FH3+ysp33v5dPlA6Ful8LZBvJzbeMs1zPV1sREUoCODHSBk+3klUOQkI+KENH+9bCO0P7aXFyeRFgezSBJHOXg5oMzyLublXnRzupULaeACRVc5dc7sNdE8phoEQNkPRn3ncrotgHR4mJA3oLhBRWAOwp6QIhDY8RLx7dICB6+/+6EoQ/0j7oUeJR7Upo1Ww+BCr/P9bFrPg1TWf3IKo46ioqybWbOKH0jkTWA69C6ehWzIFtwhAq2KNJJFL90IKNYqL2AZz1tpLrKV8LNJfxaqN0OLx6b7MManHLHLWMHrpijvimsyWAwEiPOERcTMDblIBHrPu93dlFDl1WzyEeaXJiLDEKwxGwakQr3/n8UahGHClHt0FcHkPWb134k0blm7lUAFY/y9YoYIXXQPa9biIO3JF/p5R0fkOdIwNi5vWqv5VGMaVfacbPA/dPRb7m1DDEd3W/CJnFFmW7BxXSNq2O2Q6EQqEXo7UbBfmZmq6lqGCATqXNF6ZtBQVyLRM2Xf/ZYEw5C/29Q+TEhOLMVojMNCQwM/rXxVy5hE93ncQYC88VtmfmQX6lbpyKZ+9jx35l5p0Ym8gkbbe+YE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA32579706C8AD41908E132EA3FE3035@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9534
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8adfbb19-2a0c-42e8-e006-08de75055cd0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|7416014|36860700013|376014|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	+kt0ZnqFD90Zar0V7hL+zkFKTzSJm/eoxIhZTBRcvON3omerbu8W3KiK7+9Nj/NiHAycVFNFCt1jYl+HtSmOp0IuWoD2qdftBn00nw95Ch3WW3Ohx/NYcw4bY5NKU3NT1W78u4+0u/thjQSl1pYRD/dQ+aBOe8bHF4Zqhn/17NTgOc8PeoQYCol1CkkCp029CYgTEIy5rCc2xm4c80m7QQGmir6UwhOj/O2j6L4BaMVQIVTomy/ZHnhG9vGtySm3/osi0xuFYKZkyLk53MDpQj2mFjILcG+tPpC7jAtuRJl+dLHqsQrLox/KaNAlpP2BCfy15UmS7xlHBTOfhpPMnMa6owkxM5IqTJ+lptlQoVZ1lWwSf6633tj9rehtaeMI33rOBflTDYykYVVv+s9nKa+mE+ufhc6mBqvPBOg6M7mYSvC35P6jQ8/rECQK8wn7nyoTjSo3uDy3EdEqfNvLhW+jvryycXlvTS5hi6P5nt+quQZEKkVNBUMyhf62u5DdmUX7JuJHVrxX15B/mwwvaiGc+NRTkXsmSCdHPLpSF2tidEdQnToRHLIx5LkVnOuHh0n3j7wb7br0TRF0vn3Bqt3814FuTRKSkI+1Ek2xg4qve3auqn6RAM3k7IbKQ/LXyqk0mFTxR7MpQLt8Ca/oxDWXsCthsvAtuyNfVruf20E2wbE5Pc0wCGQG/fnrXiEtgC03Rew/gy4gyA4RaMEn/jhSI04KiWMFTMzTM+DQJtqQV6xrUsQi3EA7lDIrjLIGevDAiUDAFo/aDv3bKuFad3LnqoElAFDsT0Tg1pNej0+SE36p3x1AU3raYJzdkr0oCrahZm+F973VUyC43+e+YA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(7416014)(36860700013)(376014)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aCu1bdd/976fg6C46GqcshxIUitSdSnOAoohVs5Wot5uep3/fPMxQK/Oq4EXcRMWjNrfqTyuKQk+YS7fsD3kYrzejzJLpd6UZbHydvoy38EHsDgDGL3D1RWA7eEn1UnnkdNaZoirkiDqJ1rbqIC9oraMP8yKmXgrkFUVpIIGLk6wALrbC3B/2Q67zbbSHZGFKtXHJduPJpSfQcDgT4XK69MJDG1Ylf0f8a/dkKCA1TQIS3We6aNrIBKSs2+KI2FU+QW+22YsO/DpXMntdYUf3mTyVk8VY9YMDKclR1/ZqWYq7zmTwTpauJYDMy9V2WVUyU8yWhFDXInk6iAacUjn2OrO0/16Ln5dWW0rUN1ItRA5qHR2agv9u065gj9e30wq3wtFaJTUV43HT5nge+/apEmBOCPKuIJx62gyd7WPjtKpS2cqJL8d6JOuA6JQOPdV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:06:05.4428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 062d75b7-8761-40f5-edd3-08de75058259
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7808

SGkgTWFuaXZhbm5hbiwNCg0KPiBPbiAyNiBGZWIgMjAyNiwgYXQgMDY6NDAsIE1hbml2YW5uYW4g
U2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPiB3cm90ZToNCj4NCj4gT24gV2VkLCBGZWIgMjUs
IDIwMjYgYXQgMDM6MTI6MTFQTSArMDAwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IEhp
IFBhcmF2LA0KPj4NCj4+PiBPbiAyNSBGZWIgMjAyNiwgYXQgMTY6MDcsIFBhcmF2IFBhbmRpdCA8
cGFyYXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+Pj4NCj4+PiBIaSBCZXJ0cmFuZCwNCj4+Pg0KPj4+
PiBGcm9tOiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+Pj4+IFNlbnQ6IDI1IEZl
YnJ1YXJ5IDIwMjYgMDg6MzAgUE0NCj4+Pg0KPj4+IFsuLl0NCj4+Pj4+Pj4+IFNvIHRoZSBQQ0kg
ZGV2aWNlIGlzIG5vdCBvbmUgdmlydGlvIGRldmljZSBidXQgb25lIGJ1cyBiZWhpbmQgd2hpY2gg
dGhlcmUgY2FuIGJlIG1hbnkgZGV2aWNlcy4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJcyB0aGlzIG1h
a2luZyB0aGUgY29uY2VwdCBhIGJpdCBjbGVhcmVyID8NCj4+Pj4+Pj4+DQo+Pj4+Pj4+IFllcy4g
VGhpcyBtYWtlcyBhIGxvdCBvZiBzZW5zZSBub3cuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoaXMgaXMg
YSB2aXJ0aW8tbXNnLXRyYW5zcG9ydCBkZXZpY2UgdGhhdCBuZWVkcyBpdHMgb3duIGRldmljZSBp
ZCBpbiB0aGUgdGFibGUuDQo+Pj4+Pj4+IEFuZCBpdHMgYmluZGluZyB0byB0aGUgUENJIHRyYW5z
cG9ydC4NCj4+Pj4+Pg0KPj4+Pj4+IG9rLiBob3cgYWJvdXQgYW4gcmZjIG9mIHRoYXQgaWRlYSBv
biB0aGUgbGlzdD8NCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gSSB3aWxsIGxldCBFZGdhciBhbnN3ZXIg
b24gdGhpcy4NCj4+Pj4+DQo+Pj4+IFN1cmUuDQo+Pj4+IEFsc28gcGxlYXNlIGV4cGxhaW4gaG93
IGlzIHRoaXMgZGlmZmVyZW50IHRoYW4gU1ItSU9WIGRldmljZXM/DQo+Pj4+IE9uIGEgUENJIGRl
dmljZSB0aGVyZSBhcmUgc29tZSBjaGlsZCBkZXZpY2VzIGV4cG9zZWQgdXNpbmcgc29tZSB2aXJ0
aW8tbXNnIGJ1cyB0cmFuc3BvcnQuDQo+Pj4+IEFuZCBhbGwgb2YgdGhlbSBhcmUgZ29pbmcgdG8g
c2hhcmUgc2FtZSBQQ0kgQkRGLg0KPj4+PiBUaGVzZSBpbmRpdmlkdWFsIGRldmljZXMgY2Fubm90
IGJlIG1hcHBlZCB0byBkaWZmZXJlbnQgVk1zIChzZWN1cmUgb3IgcmVndWxhcikgaW4gYSBwZXJm
b3JtYW50IHdheSBlaXRoZXIuDQo+Pj4+IFNvIHdoYXQgd291bGQgdGhpcyB2aXJ0aW8tbXNnLXRy
YW5zcG9ydCBkZXZpY2UgYWNoaWV2ZT8NCj4+Pj4NCj4+Pj4gSWYgdGhlcmUgd2FzIG5vIFBDSSBi
dXMgd2hlbiBpbXBsZW1lbnRpbmcgdGhlIHZpcnRpby1tc2cgdHJhbnNwb3J0LCBpdCB3b3VsZCBt
YWtlIHNlbnNlIHRvIGF2b2lkIHRyYXAtZW11bGF0ZSBzdG9yeS4NCj4+Pj4gQnV0IHVuZGVybHlp
bmcgdHJhbnNwb3J0IGJlaW5nIFBDSSwgaXRzIGJhY2sgdG8gc3F1YXJlIG9uZSBmb3IgdGhlIG9y
aWdpbmFsbHkgZGVzY3JpYmVkIG1vdGl2YXRpb24uDQo+Pj4NCj4+PiBJZiB0aGUgb2JqZWN0aXZl
IG9mIHRoZSB2aXJ0aW8tbXNnIGxheWVyIGlzIHRvIHJlYWxseSBzdXBwb3J0IEZGLUEgb3Igc2lt
aWxhciBvdGhlciBub24tUENJIHRyYW5zcG9ydHMsIGxldHMgcGxlYXNlIGZvY3VzIHRoZSBkaXNj
dXNzaW9uIG9uIHN1Y2ggdXNlIGNhc2UgYW5kIGJpbmRpbmcgb2YgdGhhdCBzcGVjaWZpYyBub24t
UENJIGJ1cy4gKGxpa2UgdGhlIGxpbmsgeW91IHBvaW50ZWQgb24gYXJtIHNpdGUpLg0KPj4+DQo+
Pj4gVGhpcyB3b3VsZCBoZWxwIHRoaXMgc2VyaWVzIHRvIHByb2dyZXNzIGZhc3RlciB3aXRob3V0
IGdldHRpbmcgZGlzdHJhY3RlZCBvbiBQQ0kgc2lkZS4NCj4+DQo+PiBBZ3JlZSB0aGUgZXhhbXBs
ZSBvZiB2aXJ0aW8tbXNnIG92ZXIgUENJIG1hZGUgdGhlIGRpc2N1c3Npb24gZGl2ZXJ0IGEgYml0
Lg0KPj4NCj4NCj4gSSBicm91Z2h0IGl0IHVwICpvbmx5KiBiZWNhdXNlIEkgZmVsdCB0aGF0IHRo
ZSBidXMgaW1wbGVtZW50YXRpb25zIG5lZWQgdG8gYmUNCj4gZGVmaW5lZCBpbiB0aGUgc3BlYywg
YmVjYXVzZSBpdCB3b3VsZCBiZSBoYXJkIGZvciB1cyB0byB1c2UgdmlydGlvLW1zZyB3aXRob3V0
DQo+IGRlZmluaW5nIHRoZSBhY3R1YWwgYnVzIGltcGxlbWVudGF0aW9uLiBNZXJlbHkgZGVmaW5p
bmcgdGhlICdidXMgcmVxdWlyZW1lbnRzJw0KPiBpcyBub3QgZW5vdWdoLg0KDQpXZSBjb3VsZCBo
YXZlIEEgYnVzIGltcGxlbWVudGF0aW9uIHNwZWNpZmllZCBpbiB0aGUgc3BlYyBidXQgbm90IGFs
bCBidXMNCmltcGxlbWVudGF0aW9ucy4gQSBiaWcgcGFydCBvZiB0aGUgZGVzaWduIGlzIHRvIGFs
bG93IGltcGxlbWVudGF0aW9uIG9uIHNldmVyYWwNCnRyYW5zcG9ydCBtZWNoYW5pc21zIChhdCB0
aGUgZW5kIHlvdSBvbmx5IG5lZWQgdG8gaGF2ZSBhIHdheSB0byBzaGFyZSBvciBhY2Nlc3MNCnJl
bW90ZSBtZW1vcnkgYW5kIHRyYW5zcG9ydCBtZXNzYWdlcykuDQpBcyBvZiBub3cgdGhlIGlkZW50
aWZpZWQgb25lcyBhcmU6DQotIEZGLUENCi0gUENJIGZvciBzeXN0ZW0gdG8gc3lzdGVtIChFZGdh
cikNCi0gWGVuIChncmFudGFibGVzIGFuZCBldmVudHMpDQotIEFybSBNSFUgYmFzZWQgKGNwdSB0
byBjb3Byb2Nlc3NvcikNCg0KQnV0IHdlIGtub3cgdGhhdCB0aGVyZSBhcmUgb3RoZXJzIHdvcmtp
bmcgb24gb3RoZXIgaHlwZXJ2aXNvciBzcGVjaWZpYyBzb2x1dGlvbnMuDQoNCj4NCj4+IE1heWJl
IGZvY3VzaW5nIG9uIHVzZSBjYXNlcyBsaWtlOg0KPj4gLSBGRi1BDQo+PiAtIG1lc3NhZ2luZyB1
bml0ICsgc2hhcmVkIG1lbW9yeQ0KPj4gLSBoeXBlcnZpc29yIGJhc2VkIGV2ZW50cyArIHNoYXJl
ZCBtZW1vcnkNCj4+DQo+DQo+IElNTywgZm9yIHRoZSBpbml0aWFsIHZlcnNpb24sIHlvdSBjYW4g
YXRsZWFzdCBkZWZpbmUgb25lIGJ1cyBpbXBsZW1lbnRhdGlvbi4gSXQNCj4gY291bGQgYmUgb25l
IGFtb25nIHRoZSB0aHJlZSB5b3UgbWVudGlvbmVkIGFib3ZlLiBQQ0kgYnVzIGltcGxlbWVudGF0
aW9uIGNvdWxkDQo+IHZlcnkgd2VsbCBjb21lIGxhdGVyIG9uY2UgdGhpcyBnZXRzIGluLg0KDQpB
cyBzYWlkIGltcGxlbWVudGF0aW9uIG92ZXIgRkYtQSBoYXMgYSBwdWJsaWMgc3BlY2lmaWNhdGlv
bi4NCkl0IGlzIG5vdCBpbiB0aGUgdmlydGlvIHNwZWNpZmljYXRpb24gYnV0IGkgYW0gaGFwcHkg
dG8gZ2l2ZSBhIGxpbmsgdG8gaXQgaW4gdGhlIHNwZWMuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0K
Pg0KPiAtIE1hbmkNCj4NCj4gLS0NCj4g4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCu
pOCuvuCumuCuv+CuteCuruCvjQ0KDQoNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBv
ZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5
IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVu
dCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xv
c2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBv
c2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5r
IHlvdS4NCg==
