Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F0B1AF4EF
	for <virtio-comment@lists.linux.dev>; Fri,  6 Mar 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.70
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772784518; cv=fail; b=XBWfYVfH5RVp2aObPVQgW+TmtM/EhyjqOQcXURtbkV9O0BRc3ieBNWi1gfPvXkUrFGnkY+z30fTz5XYogjJvrhAG9NNZA8GZ5KjMvZM5M8wJPoboET88sJ3KBiR7P8QQ65nx5sirT6xO26XbzwC/DMoj2V1T2le8XBO5HnnJSvc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772784518; c=relaxed/simple;
	bh=gonbTl7e8I/ukA38Lunl3lXxISfoy2VcL4vK6BTAEWI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DG3dCW2JmozrqYTSrWa+6wItYRM8LyMmr0Mj27kToseqH7ymqR7WzmYwRAyxnInWD+isXt5UO7fivtKjdUB1CdjVL/Fc4KCZphorIKiaNB9Cjcb09988c0WMi+PS1MNnVFEhaDYEmiBf6tuEcIia3R5VHWVj+Tdq8qATaC75FGI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nRxIaHkg; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nRxIaHkg; arc=fail smtp.client-ip=52.101.65.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nRxIaHkg";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nRxIaHkg"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SjQ0yos4SEWKuuUuFGNjj73IE8yOyiEzXHiPrfIkvFR4+ITpNxoALtpx68DJQpEwITZ48HQ3QhbNFFxMAaq6aLAib5ZlI8QK5NBhEBGdKskESuhGDhdrqkffLUH5m9YwV0iRI3i8p316HozuzCammJ76hsaD2iW3syAtqJPocWzMbI07ntgNijj6OseGp0UX62ckINA5I/dhb+9VfWhANW5E4lq1ukHtw60Pr54R8t18qruKF6ZiHVdJwwxOMBnwC/06F45fUxf5M2OsXw81hzE1nN9ACWX4eRk2GZ43770MBKww7+abshYdVUNDVeEiLyWkFH6g94dI3oK/gqtpMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kSAc7ru4XhWkFW2oziILRd9RB3JS6C5BXTrWdsjnSw=;
 b=SL2M60E4JHbZYc9f3B+ud5LL5dQdpFZcQH+kpx/3sppWOosUU5DWWaIL6RMZXjpG/9QSow5K6vpHALNNjuiVmLx0BcrMNsnJ0xl1nHb/dYc7yFpHhu7CUMCrikOwY0YF8C2+TmU2UMos6AZ2KTBd99WtjKO6ScpSKTX9RMpavRHa7+H4nm4z2STu4Ddy1+v4JikYThDrShnuyMK+KXIC4iX+KfrDLYWVyYszfPvq0a5LS53vkKj38UyUtTocc8r8DSFI15i3+fICe4Z3xtgyaLkeqhU0JfmFM8UwrlRGjxxEzoMZBOHojUGMoZp14IojdJRK6xDsDAYD9jqLEWm/0w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=immunant.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kSAc7ru4XhWkFW2oziILRd9RB3JS6C5BXTrWdsjnSw=;
 b=nRxIaHkgB6kvfNKS+Ecipo8TxmlvZ2c576yF5qfn54M+2UcFWXMQQmSJAegSG/R01qHf9lASlTDX9KGJvlCpxAtjYRVVFaj/t3P2g2N3oAYL+tpVmPTFsp5jE9+9bURbMc3TXmbaVrv0Y7ok8w3FvY8jhVeJBmllr7hswE/PENg=
Received: from CWLP123CA0266.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1d5::15)
 by AM0PR08MB5411.eurprd08.prod.outlook.com (2603:10a6:208:181::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 08:08:27 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:400:1d5:cafe::11) by CWLP123CA0266.outlook.office365.com
 (2603:10a6:400:1d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 08:08:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Fri, 6 Mar 2026 08:08:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvCe1CyvxzDSdtSLl5RqZ8Hc7YNoS+IZ8hAVgQ9IZCp7dQ7WZwTDVw0Y3xm6SCYiP9ngqW9k0TSOtH2VhyeJQwspjpXL4P3r4FxI7fnv4vvDto6zGi5fGpQLrtf6KXtoC1c61+JlC6p4InTenTIK6YxEiDPmvrrSqaF5JyidXFhrdJcYnFDuZRfu/h0wL6CELCbPxSt6djtdoDFvdTCW/nc3blocwvt9GY3godqPhvZbwmtWgyoshrh1np7EUMgXIhreIwpRJpboyBvegu5+erz9Op3vb2geghLuzJZc9qiSMFKwhXZFCUxFl+jHE6GEFdbh5GHGBcdyuiIJF8ly9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kSAc7ru4XhWkFW2oziILRd9RB3JS6C5BXTrWdsjnSw=;
 b=JS7pHNaQ6VBHjjEilbQXPh+0KB+iIdhvY/+wb3vXTtgdyEevdgdgXrk5xTO2v+664xud9zignDysEA+W1K9HXFsiJNk1dhvH88AgtVAxSysDeEEm0nU7vykeUY3uxpduRtARp3g7VVH7vP1jydxnyx1/mUrutE552ajPohrfPMta2GZFIcK/2RJa6P4WGiEbPSTctqIK3ueNhyS/WBhJKYnfGXsXYIZAWNREV03yaD1qNG/baEjk5j1fEIV4xqzu+CoyiDjNvCe2609Ub0+4g6v9iQAlVMAsEZy1O84+EIqPKpeUUAcUBrvr77IOUETszsAZj1/0G5VBSihuvJsgBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kSAc7ru4XhWkFW2oziILRd9RB3JS6C5BXTrWdsjnSw=;
 b=nRxIaHkgB6kvfNKS+Ecipo8TxmlvZ2c576yF5qfn54M+2UcFWXMQQmSJAegSG/R01qHf9lASlTDX9KGJvlCpxAtjYRVVFaj/t3P2g2N3oAYL+tpVmPTFsp5jE9+9bURbMc3TXmbaVrv0Y7ok8w3FvY8jhVeJBmllr7hswE/PENg=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB10364.eurprd08.prod.outlook.com (2603:10a6:20b:56a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 08:07:24 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:07:23 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrei Homescu <ah@immunant.com>
CC: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
	"edgar.iglesias@amd.com" <edgar.iglesias@amd.com>, "viresh.kumar@linaro.org"
	<viresh.kumar@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, Armelle Laine <armellel@google.com>,
	=?iso-8859-1?Q?Arve_Hj=F8nnev=E5g?= <arve@android.com>, Ayrton Munoz
	<adm@immunant.com>, "ayrton@google.com" <ayrton@google.com>, Andrei Homescu
	<ahomescu@google.com>
Subject: Re: [PATCH RFC v2 1/1] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Thread-Topic: [PATCH RFC v2 1/1] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Thread-Index: AQHcrQlLysg74l+ZHk2KzSlnonD7CbWhJmeA
Date: Fri, 6 Mar 2026 08:07:23 +0000
Message-ID: <1D3EEEFF-BA9D-4A33-A824-A903480FF940@arm.com>
References:
 <CAGynJTUcVGL9mRVirKo1R8RK1Ftz7fy3HhF2STdXg-FwjPJLSA@mail.gmail.com>
In-Reply-To:
 <CAGynJTUcVGL9mRVirKo1R8RK1Ftz7fy3HhF2STdXg-FwjPJLSA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB10364:EE_|AMS0EPF000001B2:EE_|AM0PR08MB5411:EE_
X-MS-Office365-Filtering-Correlation-Id: e74f720c-a293-440b-cbb8-08de7b578baf
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 C3ncklHYwRxValRADkjgYLA0fX9Mbdhff6F49GxFenWRvMiOwFIoTXZOX4ykM2K6fphQc604va1wHOBoRq3OXB+tHIgzspMjJ1jvCRFWf2IXLyo6zuifXbMT0pqhyI5PZNyBzOYcfdSZmjtJr3M4bEomfXdfrHdzJqfkH4QrDEQvRBl5J2OXLCkLlw9GFdMGksYWcTp/79VaZCSrJxv0sCZBP2axYDWWPDGfutyFspVmdPoMLt2cXMD788dqhOb9Y+w6d5Bt1QiGbhFgOkaL4qtyPwVFNjtX5AvNgYnP9KJ+SQtUNd2Q62NXle5czwS4Cnl/kvFaWzCt1VQs+I8RmKqokMf2nm6aC6nFVGntsQ3dMzBFEpBiBL8Z4UnPyJHDH4doQBKjPXExpboLzkbog0/4A7tvqiy84kfcfyUOMcRIjwU+EamfisqewPno/pgO/ZIXcWIJKIqi83RETWU5dNGHPrY9erVUWJnd07KUmcZVdN2U3K9haR64PELEu2TvKuj5SENLw51RLecZs7GGICun5hMfyS2yDCu7cY6oQukfor2dgofz/Lz97QFbJ/brAvk+7NodU9EWZdvx1RKpLRClL/JpyZfoMlHl/hQIyssmqXxpNkcTcdY0obsZI/8gBGQlbe+AKEj/MfsIxLWFLJTRzT6hamtdpz2DMmDe1H8vlwkQtdernKS+a+COwwA4Qj5UJB3C9nkIv2vBCue2QffXVoBNM6CmK+6sVTDfz2aVlvrXYmHcyX95YRX++D12cJD0v7rUFRONJauQUrQW/EkkDMyG42NDVyP8WptRls4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7EFB6AB9C5D63D4DAABB5FE65E25579E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 qjxkvXinlVwM0qfDZUlYMVuEEMiSq1EJhsgmU28gisBVHpt8bXRWdH3aS1yor7jNmK8t8I1TWJSbhQ4OCtZtuI+laAni01PnE7Y7CT/ID9WB8FzQv/sCO3VeQmewEYJ5s/27qS/A8G49K/9vKJ8/SpqslZxKV+8QKH2pA6uCXiICp3Z8/NdHPy5Lb0sBiPTHGgR/deSLd6vf800jVG16fjGa/CTVU3KOhbaz5+TGyxlRZ5Z+H7UtHcwK7fjQfVLCv4XP11xrXiZCvIJXSywI9HzIbxDu3YODbDN2h9VSVAyKfKauT8Jw7CuR3f2Xr6HE91NTHdpBoa06/RcdulMzOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10364
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14ac605a-4bda-487f-cf46-08de7b576616
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|14060799003|1800799024|36860700016|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	Y+cvUfeEsDiRnWgC5oiap19vEhvMJNFxg4S/I+rBe4S/gBDtu8eegvcqnmql3NbQ0XVuzF2ZgJV4Qyf1j/XK+rSGZuhTh1r8y5YupmzCYGV/Q2w5Ms1t1ISu61l3of1AYejuOv2V1KHCQ7fz2chnIbVcIkr+XFyRK1s1lh8j5I5VzEHzOo5cVt/laMSegeFo9IASY0cEgQk+KbgFHI35m2DewffJYGJOoA8BVS9p7OMuV/MHANvyqSLu7zmYhKJNipM9nFO5n/s+KeFUMxkaiLhXelaX9Iu00srh46SgGjbaw4Og+FVtiRNLrlk8lTa2bWHDKbuEFsvfm8C5zjV+1Aqv12lxbJ2ZG/eZGOqg0i83ooDpqYYw+7XZpsvP0Viqh/WUcN+hIb3HOZAUzV72WcdL9NPL+Vbj9Go1oECDSxnIO7cDucsLff1CWgaOhciBYL2fcqSf5IiH1jKet8SRCskzHIp0Zjw6apoOyQ9QuLhfNLToBYZcx0ys9BvnKFhI0cpjslZoGTXGZZ9YBzoOo4oJzM89tctd5UTZ3YTDnOKN6vDvfwrCTS/Uw694nk3rlRaI6x4POds4GhYXNeHiWnT+0RY3GuZXfybXzpmCmUWHfnHxPAnp/mrDtLoFr8d8PqtZwQdvXSPHLXPpSIqIcOoVEohn/UxzPxGJbKI8U06A8uOGF6KGqK/opI5e1PfkpVGhsEih3A+3ISvh4tnbv+wGzMkCfB0l9j//sbu4qy8trx7XOBHbeGDIzwNYj7znwYh3cT2+pfXGT297R5mHFg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(14060799003)(1800799024)(36860700016)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/EcKAH+wP+UsvjCAr2hMs4Xd2W1f8/PMsQMur28H2hr7R8rM5TKwMAG5gMVsRulvz2DOzKGDNM7hahNM66p9vpjujB2lcWy7fb4pQdfMriNowmGcSz9hbmuRQ1wcSvHK53TaaoAnf9ST+EDqk9WOqLOsFlANUPjB/PyGYA5ZHCACsM3fdV+7zhQnBr/+8nsPVzAvhtbB6dK7OyIw5ubo2HtOHZJUvBkNGOXnk/niCIccB5UROAO2zgrn+ZdwkYvUsOyvSRiCvgL9cMjXUA0NYhCARE7i4GAjMiga3QR/C8Gseis0DsBPyIbXxz1anNy1GNtKvf77jhiicYDFwwHkh8cINersscjcLWSF9aLjFJ8yJfj2XABro97T+C19wABLAKsguSQRQw5IchWx58j0p0caZR1iCLXhiBS875o17GT/YPMaGaiboN0CLdfbEiVN
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:08:26.8071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e74f720c-a293-440b-cbb8-08de7b578baf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5411

Hi Andrei,

> On 6 Mar 2026, at 02:33, Andrei Homescu <ah@immunant.com> wrote:
>
> Some minor comments below based on the Trusty implementation of
> virtio-msg, and potential future issues for implementers:
>
>> +  \item \textbf{Number of Feature Bits}: Indicates how many bits (organ=
ized in
>> +    32-bit blocks) the device uses for feature negotiation.
> I think v1 required this to be a multiple of 32, and would reject
> invalid values (might be misremembering).
> IMHO it would be simpler for implementers if this was "number of
> feature blocks" instead, like in other places.
> Is there a specific reason it is "bits" here?

Yes definitely and i think this was already pointed out by someone.

It does make sense to clear this up and have this work on 32bit blocks and
have a number of blocks in the header.

I think at some point we had discussion on the implementation impact as giv=
ing
a number of blocks here but a size in the header will require to do a conve=
rsion
where having this saying number of bits could make implementation a bit sim=
pler.

But looking at this more deeply i think the multiply by 4 and round up sayi=
ng that
unused/invalid feature bits have to be 0 is making the wording and logic si=
mpler.

Unless someone has arguments for having here number of bits, i will make th=
is
coherent and use 32bit blocks here.

>
>> +The driver \emph{MAY} issue new \msgref{SET_VQUEUE} for virtqueues that=
 have not
>> +yet be setup.  If the VIRTIO_F_RING_RESET feature has been negotiated,
>> +individual virtqueues can be reset and then optionally re-configured.
> This implies that the device should reject SET_VQUEUE for queues that
> have already been setup?
> Or could a vqueue be configured multiple times?

We had several discussions on the subject and there will be an enable added=
 in set_vqueue.
So the idea will be that as along as a queue is not enabled you can reconfi=
gure it.
Once the queue is enabled, you have to reset it to re-configure it.

>
>> +\msgdef{SET_CONFIG}
>> +
>> +This message is sent by the virtio-msg transport driver and requires a
>> +response from the device.
>> +
>> +\begin{tabular}{|l|l|l|l|}
>> +\hline
>> +Type & Offset & Size (bytes) & Content \\
>> +\hline \hline
>> +Request & 0 & 4 & Configuration generation count \\
>> +& 4 & 4 & Configuration offset in bytes \\
>> +& 8 & 4 & Number of bytes \\
>> +& 12 & ... & Configuration data \\
>> +\hline
>> +Answer & 0 & 4 & New Configuration generation count \\
> Is this a copy of the generation count from the request, or the actual
> value from the device?

This is the actual value from the device after the config changes have
been done.

>
>> +& 4 & 4 & Configuration offset in bytes \\
>> +& 8 & 4 &  Number of bytes, or 0 if rejected \\
>> +& 12 & ... & Configuration data \\
> Is this empty in the "if rejected" case, or a copy of the request data?
> My interpretation is "empty", but perhaps this should be specified.

I would say this is empty right now.
It could optimize things and prevent a GET_CONFIG if we return the data
but as the data modified might be outside of the area touched by SET_CONFIG
I think it would make things complex to say that you can get an error and a=
 different
area of data that was modified (and device does not know what is the cache =
status
on the other side).

So I would say empty unless someone has an other idea.

>
>> +\busdef{GET_DEVICES}
>> +
>> +This message is sent by the virtio-msg driver side bus and requires a r=
esponse
>> +from the device side bus.
>> +
>> +\begin{tabular}{|l|l|l|l|}
>> +\hline
>> +Type & Offset & Size (bytes) & Content \\
>> +\hline \hline
>> +Request & 0 & 2 & Offset \\
>> +        & 2 & 2 & Number of device numbers requested \\
>> +\hline
>> +Answer & 0 & 2 & Offset \\
>> +       & 2 & 2 & Number of device numbers in the answer \\
> How should a driver handle the case where a misbehaving device sends
> back more devices than requested? (in other words, if this value is
> greater than the device count in the request)

In theory there is nothing wrong in the device deciding to use the full pay=
load
it can transfer. This is not really expected but I do not see a valid argum=
ent
to reject that.

> Or is that not misbehaving?

I would say it is a bit weird but still compliant to the spec.

> A driver implementation could ask for e.g. 32 devices at a time and
> store the resulting bitmap in a uint32_t.
> How should it handle getting back more devices than it has space for?

I would say it can either ignore the rest of the device number and do an ot=
her GET
or the code could be able to iterate.
At the end the driver side has no idea of how many devices are available at=
 an offset
so to reduce the number of messages i would expect it to ask for as much as=
 it can
in one go and for the device to answer with a smaller set if there are no d=
evices in
a part of the set requested.

>
>> +The offset and number of device numbers requested \emph{MUST} be multip=
les of 8.
>> +The next offset \emph{MUST} also be a multiple of 8.
> Same question here as for feature bits: why not use bytes (defined as
> 8 bits, or alternatively octets) instead of bits as the unit for
> GET_DEVICES?
> Then the device implementation wouldn't need to check for and reject
> invalid requests.

Good point, we should make things coherent and use the unit directly instea=
d of asking
for multiple when not necessary.

I will do that in v2 and also handle the rest of your comments.

Thanks a lot for the review.

Cheers
Bertrand

>
> Andrei Homescu

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
