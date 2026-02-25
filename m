Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3319F38E5D8
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772012205; cv=fail; b=CLOwl6P+3Ypc3WDh66KK5r0L65pUmeh7Ape4s7/3FE7dtKEexLzb92psuWDrJafmqhD+ym7tV3hVizRo/LrvH7p7utYW1MWn9myBz6wFWvTGmxpE0ycax2ijiooJVPe14Pldv5xhqhuduTp7qGtGHutmE5EQeMw6Z1HE56gU0cI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772012205; c=relaxed/simple;
	bh=OuHjRYb1V+7gYBY3YunNsJ8aGlY35ZZYej6OmyHkJns=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QjAGcbdG19wJRSbZ05BhsXQv9pUK5+e3FfATWC4sSmMKDsFEXDJpMhhGgbojBzAwhnpTc/EuJ5+CzqeTJVxZ2dhmOyKUesPjFH0p6wPNO5F1Y/8bTdsEs4wwLscNK18B+KCr6ve2MlQTdRQAlAecPc40opjfaHYbNFjbY6pjJRg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GfxT/jeu; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GfxT/jeu; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GfxT/jeu";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GfxT/jeu"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Vf3hBIWwUKGt3KZ2kZ9QL/rInjqHK7TkVpRSTBvhmdgy75LUkiPxevQZ15dfe4W8Ya8XWGxjlDnv0eriV7KpBmgJGHbsKkalCw6IKDCMGpWDuj0PFAo5Ms4/+PKx2Gp3JsTKdGs/Z+H9PZifSN/9JmamrLSzpF7QPXRR4Q53mR0z6BSAvy24HOfIdgomOUQLsICaDnX0FJfOx2FEmi59Rs6fHS1G/Lsoz0JmdOcvU7ue2e4fgtcMMRj8Kn33BHL6edn8EpWX6n+DFpup74cgp0c+2+pcbaEiooy2Sr8ccF3QcNsUf2IseoWySGqQP+PTUfZlSNj+0u21bfcrnyXoHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjfcA7eBdItwn/nApnwCcZ46fm2e/pdGXYvnNxUTTsc=;
 b=SdlqR2VRRajz3oYgw2kRvL3Q4DnFJ2sIH9TQ71BGcNh4KoPHTbghT/9piTWyEX+C5JnRRmtb9Cuq5PozLdhWHKnWpv2CwnRvuunCSVWonYub26ksMIsuASZoCyEACfndwzUgVytbpP87lspxE0ymxA/ci7Tr6yPjjW8yAFUxE++MmuMIaC2OPW5mzFuanlEMvigfgBDvdoIBnLJc0XgO+obxhoip9aDx9C9FsImp2EMfZeZIm7XSO3U2FUJzBe42dMGsoCUum7bpHtvXOwA4vzzXAEYFHa7e1ihlFInGv1XGQKJTE8DDN4IE2OnnVSYXRr4fHi6c2uSTDvQeFPhPpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjfcA7eBdItwn/nApnwCcZ46fm2e/pdGXYvnNxUTTsc=;
 b=GfxT/jeuVIB8sICVP5oaL+flsB8J6YzZ320/BWculMq+DRtvLz1RAhxq1wHdx+m3u1CJBd/0/Ml3iBIGYg8noHyZN0tUZHPparUYPgdGraz6uS7slttpyeoWdEGnm3z48Qo+9mA8ZTOFvUzG4K52dhHoY2xKSh7KkAK1QZJFXbo=
Received: from CWLP123CA0186.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::15)
 by GV1PR08MB7362.eurprd08.prod.outlook.com (2603:10a6:150:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 09:36:35 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:400:19b:cafe::d5) by CWLP123CA0186.outlook.office365.com
 (2603:10a6:400:19b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Wed,
 25 Feb 2026 09:36:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 09:36:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dv5nzfwg4JekCIQKFlOVn0uOjjYaB0N5HqW35oG5P2WlgRUVoSeDf//8Xney5dW5OkCQsmFjXYhjWDXEVX/qAO4upLQ9w8Y8uInB3F7tDxMdrKQCyzjHU5Hi82xaI2MCKTO99QAcXfCbADC8Ajz+D3tXgB+pWMHdbr6G5264rAPcZshZOis82hvpeY+R40kFx0CqZGStH87NfWP51pnOzSqBEF9HXEu/Gzi5gQcbCJ+mV3pUahZiXpo5c+umF4BBpkC1/A2VDj6iPycJCvRYZXUOyA/Wspr5jdNBMkTft3Me9OiJgtz5OF8aQhDvLo/rDNtU0lIPvK5k0CJg6y7r6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjfcA7eBdItwn/nApnwCcZ46fm2e/pdGXYvnNxUTTsc=;
 b=PFDVpaeOa+8R7g+Xfph/m5ntVp9bC0KcZFQqFJdXdI3uXEo1CRjCgvd+VDK+snHR9sJb/lPlXABC5QkfOPjxXysZLXrOXKMGS7mL/ysEylz6eic3aPzznv6O0Hqr9qkqo3+EbaLLm2lnVVoYkFh0iM5JANe+zrsOvCThi0vij14gP11C/eD02GmLT/PiFzKISGOFUksQ4Z4la9Rav29K+OK/TTuTe2Lln/bM1TM91ySpQXCd/F2gtm0HFn+1PE+eBsgEsrsdRTefB7nOf93BBH0IXpe8NUJ7LP0AjgmFeRlgVBFYPvFSygCx5K+X4jiztkrqxiF+76LqEUMLQYbg3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjfcA7eBdItwn/nApnwCcZ46fm2e/pdGXYvnNxUTTsc=;
 b=GfxT/jeuVIB8sICVP5oaL+flsB8J6YzZ320/BWculMq+DRtvLz1RAhxq1wHdx+m3u1CJBd/0/Ml3iBIGYg8noHyZN0tUZHPparUYPgdGraz6uS7slttpyeoWdEGnm3z48Qo+9mA8ZTOFvUzG4K52dhHoY2xKSh7KkAK1QZJFXbo=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GVXPR08MB7799.eurprd08.prod.outlook.com (2603:10a6:150:3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 09:35:29 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 09:35:29 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Parav Pandit <parav@nvidia.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAAQBkAgAeJoYCAACXOgIAAH9QAgAAA+YCAAAOXAA==
Date: Wed, 25 Feb 2026 09:35:29 +0000
Message-ID: <701B1A68-655E-4ECD-BD17-5784AF7DFE40@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260220050136-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806139282845EA52421A9E2DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225022229-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806E3A4D9783E5DB5FA5EC4DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225041945-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260225041945-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GVXPR08MB7799:EE_|AMS0EPF000001B6:EE_|GV1PR08MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 2524133f-cd2a-480b-1182-08de74515e41
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 MiJQ3hVGAyUnBlDGkVxYlfxKNWSWkbG6gjDt+VrSlLQDUv/LFcaM5PjeILKFVnqPe3ZMZ3JXrT52wImnxq9g8xbuAQPrV2/LwblsqF8o4G0/FZJSSOicTbGSlEuCxjXNIhSLzHp20USHHFSj0MQdcltdaPCD4YP94DWjxwwZmOLtHrSzO4dvFM9DiK6Gl8sGlJ4Y7uMsjS7ZEMhziKufUzHTLQJv8syde1Tmf/gzvVhidffxhxdbl4UF9Segc2cguS45OF/+RVLRFH/zhMhpL9dGuRVIwNPmcBxTCmxJYj9dkS4FCr7UOsjDwTN0+MmFmeKxEdq+j5k7hTM9YqZQnYx95bILDo0TtNduHF2782IpyugUO/MdjcXe2xHlSrf0L2rX3sDqQ59JFhZmanVw2vj69QozlDrnH/2sxnOLHxkDnkT38JEKkWa3TrI+BPrY323ckwJcfg8txx1aVfK3qjScvlIGSHfwUv+Vwp1jlnqkdJnbVSkTZW0KKbhwMhIVzGeeE8aGD3UQzkmB8dSZLMkm9I8n4sHiZxdpMjgWvIuxvpuXnpLnopsP/JJfE+q99oUFmmBREGObSrjre6y9WWIXP2+Bg11/m2E6cerwtOH2fy6wI1phJnTgBlVMPxiXWlkeoaJKxvdNyihqa5zSDEfH9+WZ4WTN5t0MG7b2gRyeeWik65agak6wZZ6SoGeUgy65g33HfebDiUitHd+ALCRMT34UOq+JhvPUFayFETijjr2xy1r1zdOcJJ7bXgs7oTQ1mBouFYWm0EorURg7urXFRcDD535ZaRl3yDw3Qbk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0CFB359190570E439E8CAB9D887338B8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7799
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4185fae6-7c08-4b26-48d0-08de745136cb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|376014|36860700013|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	MV7MhAKqR3T+2rq/Ydv0vQoQxp+lqOjUT/eHDvzMjqIwK4fKUcl5mdoiOR6uVVT4bvWar21S6yD0x+myEJHYV1KW8Tnbc27BtOCzG67DVW2DEUp5uzOcjxK/A/exbE1CLQ6m2GnvXSm9nPBGQpL5a/nDXWi9NtGfcHPEOMKEdl+tVTw9KFBdkr0xCKB+1pYoBvUd+28uZm2n5cyU7RQFSGKaoWVPkvQGrknpqfOg9qbI2kK4fUJOW9XOxeUfVC0mMG84jHCDJXowj9HCOnTuelQiyM7njIN0mWBaAO7aHrQA3x0bxwgUOXziR8jnU2rycGfosGublgH5shMlt3CXcCO/4LIibRHsSsYXjAN711L/FpxuHLhkptcpgKl3Sd4iDtbokkg7tULq3VIA1vZGvY/8fviruI7uQiECy3Tk7bJytB3EiBdy/ywtr4K194xaa2EtN2C8W2lQBi7oaEkyt0WyWsXFAXNluZahHz+kIB0b/dMs8kC+qK03FdQCLxzk7iBYQtKdZBluYio2bmfB1MRi0MX4tlMxc+9efPJXvhov+QhicTYgwKLH8zi1rhaYYnr4J5GE16yQXKVQt0Z5Kr3zkjI/C+mA/HSSyjRoMTv4nRWZA94lvWcJspbtppe9JaRymSKchxD/eEjgCMdE3cnLPNUnq737JA3jmkwIgfh56jxjh+ZQjeDLhqzN2hDvunBdiVrexON7kCoFZnDDEYPzy6qrC6NuXURscEMMTpc7zpuUbzRaLEIpZSKjtchRqH/yWjpvRR4jXbyelxnv54C4aA2t55Nui0axWvAwzQYi8Xk30hzKL24pfRZxbIZY0H0vFAxq69v7CobZe5m5Gw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(376014)(36860700013)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JbvKCXWfLQ9R0OIZIKL7yXihUJToroopWkBlZ5GVY+/lWcYYLDoTt/r6RPldWgmNlrFUdmw2+sYHg8V4yT1numwVeih5MR8qEHOA0Je6IQS37cmS+VMgaRwTDPHwnSQfX7g+BasBfnnkFGBXUO3sqEYgIeizvWGZIYua/heIRIXQVBKJN2G8bxhepyNd0mu3f7jrt4fs9BagwWHZHKCFKIWnaH0czB1r9tnbyh1HpFeWor9GHg5cRkVKb4+Lte6S+O+NDFq9Bzwr5UJeqw65pAF4MC4JxKGcgmjKFuqUOueow7/zRNoXwSFcnh1vTFhUlhEdX+6dq2+3sbj6oo1D3/ik+SCKMtGOzCiyT2ioPmi/CEkXgb01ORtM36mTj+qgVbGQkK4TCzW0xYnYICU3qH7upLrbQ6B9LE6JzndKQTEzyBhoY2k5ylt6MrLz1wjr
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:36:35.4679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2524133f-cd2a-480b-1182-08de74515e41
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7362

Hi Michael and Parav,

> On 25 Feb 2026, at 10:22, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Feb 25, 2026 at 09:18:58AM +0000, Parav Pandit wrote:
>>
>>> From: Michael S. Tsirkin <mst@redhat.com>
>>> Sent: 25 February 2026 12:55 PM
>>>
>>> On Wed, Feb 25, 2026 at 05:09:45AM +0000, Parav Pandit wrote:
>>>>
>>>>
>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>> Sent: 20 February 2026 03:33 PM
>>>>>
>>>>> On Fri, Feb 20, 2026 at 06:13:55AM +0000, Parav Pandit wrote:
>>>>>>>> 4. I dont find the transport messages to read and write to the dri=
ver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
>>>>> operate
>>>>>>> the virtqueues.
>>>>>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and respons=
e?
>>>>>>>
>>>>>>> surely this can be an optional transport feature bit.
>>>>>>>
>>>>>> How is this optional?
>>>>>> How can one implement a transport without defining the basic data tr=
ansfer semantics?
>>>>>> For example for TCP transporting, driver side OS is implementing hea=
der format foo, and device side is using header format bar.
>>>>>> How does it work?
>>>>>
>>>>> I'm not sure what do foo/bar refer to, or what TCP transporting means=
.
>>>> This proposal is subset of past proposal of [1].
>>>>
>>>> Proposal [1] covered transporting virtio control and data operations u=
sing something other than MMIO and PCI.
>>>> And current proposal is similar, except that it didn't define the tran=
sport binding at all for the specific bus.
>>>> It is only a partial 'control-transport'.
>>>>
>>>> [1] https://yhbt.net/lore/virtio-comment/20231023104647.290759-2-pizhe=
nwei@bytedance.com/
>>>>
>>>> So foo and bar are the definitions I expect as listed in the patch-5 o=
f [1].
>>>> If it has to be done by the bus, lets write up this as 'control-transp=
ort'.
>>>>
>>>>> The simplest way to do TCP on top of virtio is to layer it above virt=
io
>>>>> net. That uses VQs for data transfers.
>>>>>
>>>> The intention of this proposal is not to do TCP on top of virtio.
>>>> The intention of this proposal is to do virtio on transports other tha=
n MMIO, PCI and channel.
>>>> Such a transport can be anything - not defined in virtio spec.
>>>
>>>> It could be FFA, some two SoC as written in cover letter example, or i=
t can be something else such as TCP or UDP or vsock or whatever else.
>>>
>>> I feel this "anything" is simply too broad a requirement.
>>> I did not see any demand for  virtio over TCP.
>>> And, making it work with existing drivers will be a mess.
>> Why would it be a mess? Because of load/store semantics?
>> If so, would the message layer also faces the same challenge?
>
> not sure what "the message layer" is.
>
>>> We can scope this for buses that can do DMA for now.
>> That looks reasonable good start.
>> However, "Appendix C. Creating New Transports" needs modification.
>>
>> Following two likely needs to stay outside of the "control transport".
>>
>> A transport provides a mechanism for the device to send device notificat=
ions to the driver, such as used
>> buffer notifications.
>> A transport provides a mechanism for the driver to send driver notificat=
ions to the device, such as available
>> buffer notifications.
>
>
> Well existing transports sure do include these.
>
>> We also need to fix the Appendix to describe about control transport and=
 full transport.
>> Current definition of Appendix C is listing MMIO And PCI transport, yet =
it misses virtqueue implementation by _full_ transport.
>
> because they all share a single virtqueue implementation.
>
>>>
>>>
>>>
>>>>
>>>> And hence, data transfer part must be scoped properly.
>>>> Maybe I am yet to read this text in the 1600 lines of proposed patch..=
.
>>>
>>>
>>> Once we get into "support everything in the most abstract way possible"
>>> we have already lost.
>> Unlikely.
>> Nvme over TCP is present since 2021.
>> NVMe over RDMA is present since 2017.
>> iSCSI over TCP is present from 2014.
>> NFS ..
>> List continues...
>>
>> The idea is to not define most abstract thing.
>> The idea is to define the practical spec that cater to requirements alre=
ady listed, including the TCP one in [1].
>
> I don't object to virtio over TCP. just do not want to block this
> work on that.
>
>
>>> No one asked for virtio over carrier pigeons.
>> CSP user already explained the use case of virtio over network transport=
 in [1].
>> Considering above many use cases already done on similar non virtio devi=
ces as pigeons is severe undermining the scope of virtio.
>>
>> One can say, I only want to engineer control transport ignoring needs of=
 [1].
>> However, we must have the doors and vision open so that users of [1] can=
 also use it without creating yet another 'fabric transport'.
>>
>> At the same time, we must define the binding to the bus where it is goin=
g to be used for the DMA.
>>
>> For example, cover letter mentions about " between a host processor and =
its co-processors"
>> And " between normal and secure worlds"
>>
>> How can one implement a driver if the bus driver does not know how to en=
umerate/discover it?
>>
>> In the proposed example, of host processor and co-processor if they are =
connected via Xenbus or AMBA bus,
>> how should driver discover this device?
>>
>> If this bus binding is not part of the virtio spec, how can it be ever i=
mplemented and yet comply to the virtio spec?
>> Can someone please explain this?
>>
>> I frankly expect an ARM FF-A bus binding transport section in virtio-spe=
c.
>> So that device and driver can inter-operate implemented by two different=
 entities.
>> Only virtio level messages do not seem sufficient.
>
> I agree at least one should be shown at least as an rfc.

Here is a link to the current virtio message bus over FF-A specification:
https://developer.arm.com/documentation/den0153/0101/

1.0 Alpha 1 version in sync with this version of the virtio message spec wi=
ll be released later today, you will be redirected to
1.0 Alpha 0 version until it is  which is in sync with the previous RFC we =
sent.

Regards
Bertrand


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
