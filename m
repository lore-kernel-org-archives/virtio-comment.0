Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35133002D8
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776866660; cv=fail; b=FYQr52BE77uto6urcSmDJTe8Be17nxx7oRts62TBenBQkENQ/JRzgf55EaGeOS20WrhVyMzJiIkIrPyF9Y8UMSucteBVbpbbk89jIq220lOupWqfOLj94XtQ0YZ11KwL0IsYmIYpXxEqnow7sI8md496tgAN98947Kwjz7vd57E=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776866660; c=relaxed/simple;
	bh=tWG9cZJQVn2YLjjM04x3+wP6JSqlUx5OMpSqAXxD6nE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kzsi7hQVGvbHrovqdkAHfnCfoq9+8NmzihddWuZsm9WLBk61uiafYUw4ErroAcWeoBrAqBRZmlKywZbpjrL35Ij+9tyCAIcP6+bvJhxfGbJpgDQrBsia58mm6iFryeKylVAr/tyoo0ulMaqd/gS4c/0WvloK5NPFwDYX6kDLq7A=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iduN2b9W; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iduN2b9W; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iduN2b9W";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iduN2b9W"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Mz6E/YbyQTE17Aqu+TAh6w4aAyv9shxXgl3BiIqxV3ax5+O4SKIslAmj7OIzICA8VCXJ+BgN7JKD5ncxe+gGE3Tfqgs7mRP58ecjwt8NVnEU6+iTdHPTd450rPXEsL6TDk92tjacDX61eWYMR5KndRxeCWJiitjDGaJVSVhZga+xa3O7rBfP5eX9LshvFp49UiMeq4m0jzJn+r4guBWHo3gjs32FxQ5t0+MrDBAnMTcNJCwAJLEmcJjyZLKNGgMhXBww/mTaU/vHM+ogyjr5zNCfCGya9U8a+8vCyrAWnTJYfl1EFD8RRhX63lP/iJfb6PjbpvvOhaIE3cSNGB5Qpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWG9cZJQVn2YLjjM04x3+wP6JSqlUx5OMpSqAXxD6nE=;
 b=J0HTQ2YgKBq6aCx90lX2lAwh3l1VHupURRdocTJmLQM+CMzk50Bnt+WMGMuhbe7SHFVIfAloL3UutPRJ+pvNWrwguc2CmmDd1L3LnxeRd300I9rzaZZlWGxIgYPEYzAxR/yLTn1/QrNLNhiVhJcmMmkTyYfliSKuOXA6eus+vT8mLLhvo/kh2PW6/ZUodcqS/VfLXozKK0DD8QL7qG3pR9zfP6ww1G1GymJXcdYEG5Fn2lSaoRVvAmxcSgP4gQbi6ur8Vn/5M9wz3Ii2zTEQQ7hKNnAie/JdhbGx4XZ0mplyNlRBFkG6R7/rkbwePEDj+0CuzgwoaIRkEZpbNqxTEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWG9cZJQVn2YLjjM04x3+wP6JSqlUx5OMpSqAXxD6nE=;
 b=iduN2b9WR+C3y0wIf6hzEwbdMEZEQ79+numzT92Tvm7C8CFZWoltJXSxkW6FywchTfVvVVNACXvp+qhOgjQe8MbgM56QCiq5SF//seMMCqfSAWkN4uERdHMFUfg+MAaoLlpVT7TKCWjQL5+hoArGSWR9ZBfxE65qHeCqr0uIt4o=
Received: from PAZP264CA0245.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:239::18)
 by AMCPR08MB11972.eurprd08.prod.outlook.com (2603:10a6:20b:771::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 14:04:15 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:102:239:cafe::40) by PAZP264CA0245.outlook.office365.com
 (2603:10a6:102:239::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 14:04:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.4
 via Frontend Transport; Wed, 22 Apr 2026 14:04:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cib+7abf4TOIbPhU4npoUdSFLNfnoqIBENQgPs/ez8Z/4c5TBTy8oY+P8Ha7CRwGUOnRPAWKlzYoegR2kWvXS8ZGorebR0OLFP4uiH952xuor8MNMZPZSAMmNfEs7GXWUPf/G4gFrRl6//jmppvDsIfMbWfpqZ32RRq9jJg0ECOLO1Vtn7akNRf+ZMXdCqXiTcLSW+3WBeAkVvtxfN44o40kIAIpTDULNgvXexIlYO4/PhUx+W//GkWuhIdyoguA8XfGsy+MJpz8vyR9Moa2lj+I0Q+MdPGizcjDP2y09g12WKeqPAiRojdnlSUly+ZdpRm5/QURavRIB1Nfik6d3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWG9cZJQVn2YLjjM04x3+wP6JSqlUx5OMpSqAXxD6nE=;
 b=mNSCCfqoVb5tvJfUHlxTI6xFWPD78BtmUMR+0Y2lCIwltdXMrKoHZQOot7LvJ0eKl3mLoQcZ6oJdIa7A8nrWlCXKKhj4iFKAOGB55KOH+qkg3dv9YJnYmGsOpM4Zuoa4fj9+3DT+fOUZef25rGlCfQiMQs2a8l5HHiuu7FwvfcBVbDK0uqW8SL2QekCUl7sx8ogjHCdTLys/q846gdftOEKu8v6Utxt0+yoJwM+nI7tPw3l9VBvPUYQz5cz8lo77A0CUPSCmn9SSczVxNkx1kb6K9mah03ZfZ1IZrvAfC1lUoENzUR38ZhggNZCGjlIa3fJ+i/9HJ8QSJKH6HBHhiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWG9cZJQVn2YLjjM04x3+wP6JSqlUx5OMpSqAXxD6nE=;
 b=iduN2b9WR+C3y0wIf6hzEwbdMEZEQ79+numzT92Tvm7C8CFZWoltJXSxkW6FywchTfVvVVNACXvp+qhOgjQe8MbgM56QCiq5SF//seMMCqfSAWkN4uERdHMFUfg+MAaoLlpVT7TKCWjQL5+hoArGSWR9ZBfxE65qHeCqr0uIt4o=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB6565.eurprd08.prod.outlook.com (2603:10a6:20b:33c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 14:03:11 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9818.023; Wed, 22 Apr 2026
 14:03:09 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
CC: virtio-comment <virtio-comment@lists.linux.dev>
Subject: Re: #virtio IRC channel on OFTC
Thread-Topic: #virtio IRC channel on OFTC
Thread-Index: AQHc0l9E3PqFUC2MkkWndE4Xw6KokbXrHLWA
Date: Wed, 22 Apr 2026 14:03:09 +0000
Message-ID: <206F0630-B109-45C5-9E06-E85ED3D28A6F@arm.com>
References:
 <CAAjaMXZHoHwA7sWkZYE0ANah0vwRWtEUYLvc8ULxm5-jggGeYg@mail.gmail.com>
In-Reply-To:
 <CAAjaMXZHoHwA7sWkZYE0ANah0vwRWtEUYLvc8ULxm5-jggGeYg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB6565:EE_|AM4PEPF00025F9B:EE_|AMCPR08MB11972:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2051e0-ecc3-4bcc-d5b3-08dea0780973
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 zBTDpxCLTAey47IbfRNFyMF8lVPmlGIuTAVmqKL4yWUvxYXzY2PsBeB6mHV6vvGCOpH/EcUco944GtB6l62zSlW4YoWnn+f1jxzbYp7lL4c6a0eKitVVUZPJwcDp8nqK9txdciBwNbju+ijaMKmYg4UsuEGsttUsdTbDfRyzcDxuzwWTX8PcmTzoeIARcv9oXSqV29xh8cYJQVu5efo53oJe74E/eaq3NVb2wBQlyfX1KfZ50wGVGbJ6b295w+3mmDiGSKCkMz1QhfA1rAAQ4swdzNXwNV8ff+RZ0tYb0H7+xRHw5p0XUp4Zi8CYVAWJZvmv4LKdFSXBdG/G/ym6Q1HtQNGVG2e1dlR4DfKULoTzl8glF9Vr2OzV6MR2ogEA3DTrE8QFJH+Q4Rf/ALQhViLjDMQSvHObuhHoCj0PrVMacAMAUyOaERk03BN8QNckDI5bupXjdcPf8GPb7cIO2bxnROq0JNtxD29QrGfcEGDHuJzYGK250SeRM4NbU4cO+DttErnm1UmXDg98HxaxVIAJp1QMDySDau/IABtHh4lnkmY13i7XgRquy0zlgKc9cNywijpnZOWllZ1lpuubpX1mIww51H8n95OhDCS4WErdAVEmRQaZSkU0+cOtYl7oFtFmt4/gFUZx7Lf1UOdgwvXXpDdbyWNiNqFNEZkfYJ5mQ+t9gHycZ7YmvrIbZXgjHxhkYQX8PjBKikmFHGdStfxVWsbJjqcBrLoNyikG4Ho6Ubtk+tZbO7cNgCIWx5j3Kcv4rbtOBjGSUPIVJFxi8WIgMTs3qZb5rNu5w1PJxAw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <02173D19204A9A4481B0B49CBDAD71DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 lX0TgT40cZv5nzWqliqd4lyLcjvFjjni0w9ULIActMCFHgXidywa6e0H95OvrscA15D6H4Md9kr+1IWBBPiBguluhX6Jt6pSCv6bJ3+x+9bvP5Asai3mgZOeYWVaIDM69Lt48djcZ8m5MrVn84nP2Cbsme0IDohnegOwTWEIxZzGuBnMdm26NvjnTRVjWLnPlkqKxywKiszhqDbXqqsfMr7d/vUp9qaak3NTlUy+5T68GvypTJ4btqm9/cVqniisUpgg+asIS7iVywnD6P5qFVJnl2TmxAr3FqdH00YYjqD2TxJ4//VB9kN0OwdKE1osDr612OoUw0nor4EEaBfgJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6565
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55a8574a-1ebe-4a28-f4ab-08dea077e2a8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|35042699022|14060799003|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8VVeGAoh2iEIi5LXQ/tjlnU3ShgNKD/3Y+Zd6WK93MRh36Pog7F7R1hEtNX47mJe6AWMCVzWz2d+kmHUWG7QacdVz5IpdHBE0VIhq8kehcyaWbJBc43s7aWUNYO5LaNASuND+KK5Gj9+e0xGTXPkJpJy69Lg5H16Z47Hl0reWqjjYp5Vcb/i47iETJ6lY7AGtIVIdra+v0t3wKTx4zRqLGjNGl8PVlnuK91gD16L4p8S5shPMaQqlekigioy67OTTZekO3/czTq1ad2heYCKH99PhUlaX46SNZNIYVTEonlEib+l5sMzOG9+zEPThmhmd3j/Nj6+YASGRt+bcEZqHfbZV3DhiBRDsss9oftAi91LcpTXc3G0rrjEYdaYKiYX5FzbcVInjgUb16WumFOhGTfDVMsjo96X6sp21Uc79EjbBmlLDEQv7uaKclcflaxoPQxKlOzxv848SwObVZu8n0984jqYamvto/J+tA8fDT7QdzSs7ZOjK6KBd9IkTfFo5sjgQ6nP5tilfJyj+NFtATrpsxLczoRyU8tDuoroMuKOz3GRvnC1Y8AeAwJaGLnXQNk+ThuAgttR5Bv1KhTnNq0aDIm72KMcpADnLCa48k+/M5jBFaFOG7gY7pkHBHy/Y1DlLnryJNTJ06/Kj9ftHgaO3dHQbmlDn3Ol0HU7XPehL2OvokNdQ99VHKLYAECeJoS1u0Yj94qrvtjNZJR6OHfjqJOrMlLFDSHwr3EQSADY/xiSFumm3KhdVlJxpJmr4g+M1Uy72jHN9LJaNH8ewQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(35042699022)(14060799003)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6CTRkBYMa72KAcfHMGlSrIacB/SmTOmeJHWvxReD2mRn1km32nEhIjHdo5S3X1aeBZ5U0xJQWFo0iyvlvy1iq0zUzUywZo0Cgk3VDa7CTfL4WBi05AnS4IWrQ5aaeqhEnKTb9z9Kq3nJ1AD7xb8RRPE9c/0SfEdnS0SxBXPK8dyFn5b1i2KNA2JJY3J9sguQ/SFEKk4f4fSMOH+9sRcW4Z3Y4876w3A8jbo9AYAnPMKBUshM6u2eyyX01tSkGP4UegV/kgSbdl/ePOGYCoFdplowd81navFiakmeTd/S7691VUPH0EXn2K9wFNBvcZJUCenlm8E2SszxgsWj6QPOUgVDYZlchPTDlroO1Ser7L9ZgeeVLUnxa9cYq6lFNfDr2i4HRr9r2GWFz4op2Ai/HTb6QXwgDCshrhPUZ1LPUsBb6W+Xz1fcKgWOoeyAUudy
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 14:04:14.7812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2051e0-ecc3-4bcc-d5b3-08dea0780973
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR08MB11972

Hi Manos,

> On 22 Apr 2026, at 15:49, Manos Pitsidianakis <manos.pitsidianakis@linaro=
.org> wrote:
>
> Hi VIRTIO TC members, stakeholders, interested parties,
>
> I took the initiative to register #virtio channel on the OFTC IRC
> network for general, unofficial/informal discussion, since most of us
> idle on linux related IRC channels anyway. I invite you to join (you
> can also join via Matrix if you don't use IRC)
>
> If a VIRTIO TC member joins I can transfer registration of the channel
> to their nickname and give them operator rights.

This is a good idea to have a way to communicate like this but I am not sur=
e IRC is the best solution.
Couldn't we create some google chat or something like that ?
I can access matrix channels for example but IRC will be more challenging.

Cheers
Bertrand

>
> Thanks and see you there!
>
> --
> Manos Pitsidianakis
> Emulation and Virtualization Engineer at Linaro Ltd
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
