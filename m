Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=2 smtp.remote-ip=40.107.159.40
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794846888;
	b=p+FER8i4F8kc8dnya2u15gV5+We6HmSjJba5Icc2/aPzbcG75KQzcAIxXGtCNM0FVcUi
	 PdZBFI8DhXwzQSWjNgl90vcZXplDPgxt7T6aZhdY+jkUNqeWbpejjN3ui0OP0AuolQdlO
	 zvqJ5zPS2Ev1BjREodE/HwWB7sGEcpvIhtXn/g9JdNGqSwoZooTOpIdCVDpYJVdoM3ULl
	 RxqfVx2Avq/pnLEVo8jq4tgWAzLWgBAra8KbeZoczB+kFnQQv9ihMKT3/35beQB2MQo44
	 XxbhtwkWAfaxAX9A6C/ERGaVDB9FHGxrbhUssgAxq1cyUwzsHYviwmcOkJayswU8eyw==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846888;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:x-mailer:
	 Authentication-Results-Original:x-ms-traffictypediagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:x-checkrecipientrouted:
	 nodisclaimer:X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam-Untrusted:
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
	bh=oPPVKBx64NfoTG0k/4ohUGu3Bsl5X2Ik5fwfVipTovI=;
	b=HYIKyxvdP0igPbZXdeKsMwU9QCTOv87UbOLkNH2ZcZg1pIzurGp/kP2IcDREdEaj/TQ7
	 ExqY3Dv8RnqZ3Wyyv+EbdEcXYHBV1zfGHezfejWGsiymLSrboHIBiAtzlrOFlTUVj9GaF
	 KS4GOgl2XlDiWqoI49wm9Ji9YD1LM8M/IYOG73fUJ0EpeOlxy8ZotOHyBYgDZj32XNU23
	 bk9BrEC1NU/RmV0fnSOVV4HPA+kyhiB/G2U7eK3d6ezXOJ5PP6WniSXrHivDQfbfxRbua
	 9nQTwrOsnmtT16G3Wj9l/iyhFwF3ac6x7vcBNQBDakYemrPo3/ip/lFI8fHZomgItcA==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=PXITKv8i;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=PXITKv8i;
	arc=pass header.oldest-pass=2 smtp.remote-ip=40.107.159.40
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013040.outbound.protection.outlook.com [40.107.159.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0F3606A8B1
	for <virtio-comment@lists.linux.dev>; Mon, 16 Nov 2026 16:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0F3606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=PXITKv8i;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=PXITKv8i
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JIMoYlIi+6uEzoPIgP7LgdSlb7L5UJaUMov5vOMovT9I56yqJAxGA8Zs/iMzJ01vX/jRCfgEX9uXQhKkwnkoSe7RIiRkFvXyHrMYpc0tl3zzMtDjZ5NhmNenmr15mD8YzykJx0CmQaJkL67JNbBUJN4X5W5P3dPtgVsrxuwQgxI+UQWR9sNqIF7oGNMr7USF9/4/xzYDevMk83By3aO3w51AduwR7QKLeRx8rJPodPoVwji1NEJBQAQNIiRzszfIsNaPbsM8RiV1XGvf0QG0U4tlxAYPYzkEyl1gqmmejib1pYcnOyaigKGoF1GVkH79pASfY3EEhHMjgBp0G1m82Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPPVKBx64NfoTG0k/4ohUGu3Bsl5X2Ik5fwfVipTovI=;
 b=fO93YbrTtqWjbPjKHtP4x4ZfpPW5tceaizoTtUXBtF9khaJSP0KCH3s5HSX5VJ7/QSL3mfNf1+vIS7TLi+EHruMZUZLIsOQFVRjEQjFSDeZcJ+wQa7NU6TeuKzFc6FZi9UCIJala+7l7Yp1BQIIgiOVXsoA0tqLZdDqwypblqIo+2Imf49zbWPYagY9YBiOVEPtpfgeKN/GelHzqWd8kJtUEeKAsXdn1DlFLwXWbFudcTgT7YXQ8Xerx+IRF7dsr4b5VkyDYkji9HaODxEa8qLItT9t1jDae+9ISrW6bPHdFWlsoPYzB4CuBwSxbsiHbjqa0mfCUcpMG5SNCy4lOig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=immunant.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPPVKBx64NfoTG0k/4ohUGu3Bsl5X2Ik5fwfVipTovI=;
 b=PXITKv8iwm9Gtg+ezqBLXkm4HupZMc3bGf4U6H0HZRs5D6/1Q4JeUVUG20IjgVaW502XpZG5cghX4UsYUPKbgZk8hJpEYX9W6bIet+5/atDkzhILuzl2gkQ2esfjIa2JSPvSATOWtXGdvsjio+e7xcJaU6yRJz/uDC0ixf2zSF0=
Received: from PAZP264CA0078.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fa::22)
 by AS8PR08MB9340.eurprd08.prod.outlook.com (2603:10a6:20b:5a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 16:34:40 +0000
Received: from ZR1PEPF0000E6B1.eurprd05.prod.outlook.com
 (2603:10a6:102:1fa:cafe::10) by PAZP264CA0078.outlook.office365.com
 (2603:10a6:102:1fa::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 16:34:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E6B1.mail.protection.outlook.com (10.167.241.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 16:34:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVqqnTGwNJAAXCFJQyE7y6nLYojgG+hbPlAkcSUdAdYoUKWjdxOccWeI555s/KsZAjfRl/m1Cq7WE12QMit1/NBJCS8MAva+uZ5D+n7tgv2NZ5mNTACZLuA+tWzMZXAReYukqVZA8vwuDZ6/OsZf75RGOrTyht1jPUxCaxjqBqXUCLnwrpN4VtOPZ6WU00sqfOUWJLS6Zb4ZPwtwhWPSSL18VFIXo2TdBQXBxePqpSGoDgbh2lEULORVRmRAO9aChwK4BVcxScy/zf624xqoh6kBzwuhXcD/qrp6oBPsBrQlYNvrZ08dz9ZZ84eJbASUaVnpoqVBDGCByyLZ8GObcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPPVKBx64NfoTG0k/4ohUGu3Bsl5X2Ik5fwfVipTovI=;
 b=I0v3a3wv761sDoJCD+t3Nv1bBvDYqTPbeBWYjYmOHSDXI1yB6du0OfxPKtNOzYxoJ87BeEmt8g4zTzFwDi08GgYXWHWsqorU8/Fdppj1S3QwSo0DX0TMZZJc7gX4BwYsYA3B6XXNNvbVCeeisxtN7oC03iJDdPfY77zWkfz49MpaYpHo7bzEl+2VxvWp1bD7uW80Soc7jt8TWTMoQPsTtJpJHT07qV0M9SVAWZ+fqTXqfHYUjEOs6NwaxKidLRzuaqcex5ASuGqPl6ipLkh3FIsxFkfnkBYMzBZzGe8q1/aroVT/wVfsDsFlh7LfkjgwqoqHIKvG2Y5tLtVJeJqlsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPPVKBx64NfoTG0k/4ohUGu3Bsl5X2Ik5fwfVipTovI=;
 b=PXITKv8iwm9Gtg+ezqBLXkm4HupZMc3bGf4U6H0HZRs5D6/1Q4JeUVUG20IjgVaW502XpZG5cghX4UsYUPKbgZk8hJpEYX9W6bIet+5/atDkzhILuzl2gkQ2esfjIa2JSPvSATOWtXGdvsjio+e7xcJaU6yRJz/uDC0ixf2zSF0=
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by DBBPR08MB5897.eurprd08.prod.outlook.com (2603:10a6:10:203::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 16:34:05 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 16:34:05 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayrton Munoz <adm@immunant.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, =?utf-8?B?QWxleCBCZW5uw6ll?=
	<alex.bennee@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Armelle Laine <armellel@google.com>,
	Andrei Homescu <ahomescu@immunant.com>
Subject: Re: [PATCH v2 0/6] virtio-msg transport layer
Thread-Topic: [PATCH v2 0/6] virtio-msg transport layer
Thread-Index:
 AQHc/KbaWNcK70X5cUmaq2wR+xGjkLZY4R8MgAB08gCAr5EDCYAABUKAgBfxL4CAEPm3AA==
Date: Mon, 16 Nov 2026 16:34:04 +0000
Message-ID: <439BFD26-85F3-4543-8E47-7BCB232DD163@arm.com>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <87ldbuu46o.fsf@draig.linaro.org>
 <20260701181854-mutt-send-email-mst@kernel.org>
 <87mrs7yt4o.fsf@draig.linaro.org>
 <20261021114219-mutt-send-email-mst@kernel.org>
 <CADC70uNEa24w+PFa8Zv1X14jhheQR45x4fW2dUS4SNjxr_mDFQ@mail.gmail.com>
In-Reply-To:
 <CADC70uNEa24w+PFa8Zv1X14jhheQR45x4fW2dUS4SNjxr_mDFQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|DBBPR08MB5897:EE_|ZR1PEPF0000E6B1:EE_|AS8PR08MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c649ac0-f8d3-4c8f-6141-08df43ff828d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|4143699003|56012099006|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261022075727099003|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 RoPuXjUKbMd+/MOJE1diVT7drbOA9Ixe2UzR0uRGIsuK8UqaVbqO+dFLP0+bKSFe4a3WLGpsK+cQbJYSHIBogXC4YBFbfpwjsPmdDExsKu4oaf3k0Flv0C611Jti7OXqwZOXUk003M9x8uhJLmq91+GOnic4jKCByvYUz7P5xLX7gEJK1P6vPc0YWBsr7T5WMLN0+8XANyqyG2q1Eh5vFWECbt1bWpGYKFsUqdLGrIUfRzRiAlgDbbpWlfDmA2BaJCVpapo/DHcdLZCl34cR5hmwFORlEvcTH4fI0ep+OJz4Wgxptk4V2Y2i3bnrGcGWxwojw4uDP3nU5OzGBBQHl4bnX9YBPTs6+xastxr8/8d2+nWpZ148L00J1Q8NbLdI7JEBzJYobw4SjH8TdiJMp6bYdwyIOW+3kZV/JpZJy/ElojPRYQOpGz8fhcdrnB5jTSdrTJB08KVLCPUr2wlXLTD73e4NStLC1rbWZvt8j0CQVbVCBaexWI8Ez9h20+LWfcKsZJ6LL8vgiWxJLZ1E5K4OoaZj3wfkYvsTpRwPXS5Jk/hRZEj3rymUdHDNE0KJkIviPS5CDNvY7A4eVhn9Dp4xdUsyMmVu6xx1lakua8Fh/adt6zI8fWqK0vBdzVySX43LJhAIhhAlkpooZoJ+Svrki5mBbO0PjHozZnX9gXoU5mPDKVRRUP97dn6HDyUFa9mzMuY8aFQ3tLhBXRu70mRwedIIoUoJajTZ60VH/90=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261022075727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9EE22FC2976C14F8E2197C9278FD1CB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
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
 n57+GaM1znx3NbsDNZO4+OsaCyX1Fz3wu67k5XFTZL9QFYU/b3aFcavL3V4HqOwTwlCAQXXy+/Ez+1A2TC2z5pX1hklLHWy/+1oKgVtiEZbzXNmiwcLoWmUGPePDxg6eqycjKDzN76GUeyRQXoPTcFeEaPGhIVIQ9Gcz7ccsv6ODUwp1tl/AuSwgtYIiVEk5xyqmi7NicyLYscNfeEEyYbb846B8457vn19OSjgD5u2sdPaAMs7nFIwJRkngXGyl0HYUpOxd50V7sAN0iW6R6B7HbByjK85FiuDuXm/CFowRlimb/ZZAYEIpXf6Nnp92keuVi7ksOjm1DXG3nUKWzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5897
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E6B1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bdb37dc1-32f3-4736-1ae5-08df43ff6df5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|14060799003|35042699022|376014|1800799024|18002099003|22082099003|6133799003|11063799006|56012099006|4143699003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xPqSUDCz8W8/yIhi4eQOq6z6JrpZzD4nOwXFPxBs9FhzWFAIU6CRut/e5JbEE6zlmCVkkchglc8Q2cpJvbR2d8KWnDHcUTAoEBJo9VLyh8kS4jhHXgsri6Pw8H0X3pSdO9TU3cPy767bu5TlGNiVtZLW/J9e5imnbmDyaL8qUbsXQ3WGNcqOgObb4FGWdATDbGOGDZJ8HCMuiUGNdoEqPkD/fWEGMvyEOV+rsEoseYn/RhHWgArkPei0Xdbc7ZJc5se1Qb6YqNmvtbsiUXMIaHrH2XJdC6jLntUcMpr54EhIk/9nRPsAKChgAuSnjD5h7UXhSiXbEnisfNw5rYzoDuhKqJRW9FOldEy0dy6v49tQg/R0t8EmREAlM4IelrTxR6/UaZCY4sxwT4AR7QZp5VvY/teHxFePGEjwtwS1X53fdowQo4BxeXXBPWepwsqeqIF9xARTYNbnXoiJOh5/6RSySGMh+Dsm14qCMBUJO9HJlnUQfcwllpfLmlQNhSYDp5MmJJ8OVec0NMcpJIvovGizn9diuHSyOpRIz7NgyqJnlAuS6e+bBb5JRVoXe5lGDpuPlPavcHPBbeVvFM3T9cWcju1NrnimBr1iCqJ/G7GaSpJ9sWU2xil1Hv2puNi8tHBFpLUnKGZ8tN3BwmRM+75+C97NKNwGYRUWHWa4A+GCvEtGOjOWRE7YsZe7IsjSLSyC034wD3FlC+OYTIihXA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(14060799003)(35042699022)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(4143699003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6NK/vv+5eiJIUkRCT7kIEUvHlA3kKloBPVmEaenTHOzgPrGK0U/qYjyurhwM6v/KL4lEGNgRVV6qswnpdh8rzSLm5ek3IyF//zNhhd1I3DYmtM/Yb/p2pDS6qw4BnzrWaShwR36PK7nG2RWoUpdhOvYCVvB87JSd5Gb71wvfj+Yfi7tDISDBpXjhK5oQ7qwN6pZb80K780xWY0+AuBmHA9gTMnQOGx5U1fWz8pXvEYct/dzRlpVJvAqmtP7SLE0LtKxhrnx9vsyJfldYFwSzd8ZxKyHkqDrhDTXwkFV5K4+PqTvTpCqRV7ydIA85sprMfjIIOp5eOUeyeAfLJ0wSbYNetoRv3Z+njTfPrlbYRJ0gkt+IQi9yQnoXFQ+a/oGyeYZBm6vaNshbJHepS+MhvMVOeim7JS7W3YSD3yGn3AKfoaFVfn0AYah29TynNSYu
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 16:34:39.4282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c649ac0-f8d3-4c8f-6141-08df43ff828d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9340

SGkgQXlydG9uLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjayBhbmQgdGhlIGltcGxlbWVudGF0
aW9uIHJlcG9ydC4NCg0KPiBPbiA1IE5vdiAyMDI2LCBhdCAyMjoxOSwgQXlydG9uIE11bm96IDxh
ZG1AaW1tdW5hbnQuY29tPiB3cm90ZToNCj4NCj4gSGVsbG8sDQo+DQo+IE15IGNvbGxlYWd1ZSBB
bmRyZWkgYW5kIEkgYXQgSW1tdW5hbnQgaW1wbGVtZW50ZWQgdmlydGlvLW1zZyBvdmVyIEFSTQ0K
PiBGRi1BIGZvciBhIHZzb2NrIGRldmljZS9kcml2ZXIgcGFpciB0aGF0IGlzIGluY2x1ZGVkIGlu
IHRoZSBBbmRyb2lkDQo+IE9wZW4gU291cmNlIFByb2plY3QuIE91ciBpbXBsZW1lbnRhdGlvbiBp
bmNsdWRlcyBhIHZzb2NrIGRldmljZSBmb3INCj4gVHJ1c3Rab25lL2RyaXZlciBmb3IgYSBWTSBh
bmQgYm90aCBzaWRlcyBoYXZlIGJlZW4gdGVzdGVkIGFnYWluc3QNCj4gb3RoZXIgdnNvY2sgZGV2
aWNlL2RyaXZlciBpbXBsZW1lbnRhdGlvbnMuIFdlIGRpZG4ndCBmaW5kIGFueSBtYWpvcg0KPiBp
c3N1ZXMgd2l0aCB0aGUgc3BlY2lmaWNhdGlvbiwgYnV0IGJlbG93IGFyZSBzb21lIG1pbm9yIGNv
bW1lbnRzIG9uDQo+IHRoaXMgc3BlYy4gV2UnbGwgc2VuZCBjb21tZW50cyBzcGVjaWZpYyB0byBG
Ri1BIHRvIEFSTSBzZXBhcmF0ZWx5Lg0KPg0KPiAxLiBBZGRyZXNzIGZpZWxkcyBpbiB0aGUge0dF
VCxTRVR9X1ZRVUVVRSBhbmQgR0VUX1NITSByZXNwb25zZSBzdHJ1Y3RzDQo+IChpbiB0aGUgUEFU
Q0ggdjIgMy82IGVtYWlsKSBhcmUgcmVmZXJyZWQgdG8gYXMgcGh5c2ljYWwgYWRkcmVzc2VzLiBG
b3INCj4gRkYtQSB0aGVzZSBhcmUgYnVzIGFkZHJlc3NlcyAoYW4gYXJlYSBJRCArIG9mZnNldCks
IG5vdCBwaHlzaWNhbA0KPiBhZGRyZXNzZXMuIFRoZSB0ZXh0IHNob3VsZCBzdGF0ZSB0aGlzIG9y
IHNwZWNpZnkgdGhhdCB0aGUgYWRkcmVzcw0KPiBzcGFjZSBpcyBkZWZpbmVkIGJ5IHRoZSBidXMu
DQoNCkFncmVlZC4gRm9yIHYzLCB3ZSB3aWxsIGNsYXJpZnkgdGhhdCB0aGUgYWRkcmVzcyBzcGFj
ZSBhbmQgZW5jb2RpbmcNCm9mIHRoZXNlIGZpZWxkcyBhcmUgZGVmaW5lZCBieSB0aGUgYnVzIGJp
bmRpbmcsIGFuZCB1cGRhdGUgdGhlDQpwaHlzaWNhbC1hZGRyZXNzIHdvcmRpbmcgY29uc2lzdGVu
dGx5Lg0KDQo+DQo+IDIuIEl0J3Mgbm90IGNsZWFyIHRvIG1lIHdoZXRoZXIgdGhpcyBzcGVjaWZp
Y2F0aW9uIGFsbG93cyBjb2FsZXNjaW5nDQo+IG11bHRpcGxlIEVWRU5UX3tBVkFJTCxVU0VEfSBt
ZXNzYWdlcyBpbnRvIG9uZT8gSXMgdGhpcyBkZWNpc2lvbiBtYWRlDQo+IGJ5IGVhY2ggc3BlY2lm
aWMgdHJhbnNwb3J0Pw0KDQpUaGUgbm90aWZpY2F0aW9uIG1lY2hhbmlzbSBhbmQgY29hbGVzY2lu
ZyBwb2xpY3kgc2hvdWxkIGJlIGRlZmluZWQNCmJ5IHRoZSBidXMgYmluZGluZy4gQSBidXMgbWF5
IGNhcnJ5IG5vdGlmaWNhdGlvbnMgYXMgbWVzc2FnZXMsIG9yDQp1c2UgaGFyZHdhcmUgb3Igc29m
dHdhcmUgaW50ZXJydXB0cyBhbmQgZ2VuZXJhdGUgdGhlIGNvcnJlc3BvbmRpbmcNCnRyYW5zcG9y
dCBldmVudHMgbG9jYWxseSwgd2l0aG91dCBzZW5kaW5nIGFuIGV2ZW50IG1lc3NhZ2Ugb3Zlcg0K
dGhlIGJ1cy4NCg0KRm9yIEVWRU5UX0FWQUlMIGFuZCBFVkVOVF9VU0VELCB0aGUgaW50ZW50IGlz
IHRvIGFsbG93IGNvYWxlc2NpbmcNCnByb3ZpZGVkIHRoZSByZXF1aXJlZCB2aXJ0cXVldWUgbm90
aWZpY2F0aW9ucyBhbmQgcHJvZ3Jlc3MgYXJlDQpwcmVzZXJ2ZWQsIGluY2x1ZGluZyBhbnkgbmVn
b3RpYXRlZCBub3RpZmljYXRpb24tZGF0YSBzZW1hbnRpY3MuDQpUaGVyZSBuZWVkIG5vdCBiZSBh
IG9uZS10by1vbmUgY29ycmVzcG9uZGVuY2UgYmV0d2VlbiBidXMgc2lnbmFscw0KYW5kIHRyYW5z
cG9ydCBldmVudHMuDQoNClRoZSBjdXJyZW50IHdvcmRpbmcgaXMgdG9vIHJlc3RyaWN0aXZlLiBX
ZSB3aWxsIGNsYXJpZnkgdGhpcw0Kc2VwYXJhdGlvbiBpbiB2My4NCg0KQ2hlZXJzDQpCZXJ0cmFu
ZA0KDQoNCj4NCj4gYmVzdCwNCj4gQXlydG9uIE11w7Fveg0KPg0KPg0KPiBPbiBXZWQsIE9jdCAy
MSwgMjAyNiBhdCAxMTo0OOKAr0FNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+
IHdyb3RlOg0KPj4NCj4+IE9uIFdlZCwgT2N0IDIxLCAyMDI2IGF0IDA0OjIzOjUxUE0gKzAxMDAs
IEFsZXggQmVubsOpZSB3cm90ZToNCj4+PiAiTWljaGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhh
dC5jb20+IHdyaXRlczoNCj4+Pg0KPj4+PiBPbiBXZWQsIEp1bCAwMSwgMjAyNiBhdCAwNDoyMDo0
N1BNICswMTAwLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+Pj4+PiBCZXJ0cmFuZCBNYXJxdWlzIDxi
ZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyaXRlczoNCj4+Pj4+DQo+Pj4+Pj4gVGhpcyBzZXJp
ZXMgYWRkcyB0aGUgdmlydGlvLW1zZyB0cmFuc3BvcnQgbGF5ZXIuDQo+Pj4+Pj4NCj4+Pj4+PiBU
aGUgaW5kaXZpZHVhbHMgYW5kIG9yZ2FuaXphdGlvbnMgaW52b2x2ZWQgaW4gdGhpcyBlZmZvcnQg
aGF2ZSBoYWQgZGlmZmljdWx0eSBpbg0KPj4+Pj4+IHVzaW5nIHRoZSBleGlzdGluZyB2aXJ0aW8t
dHJhbnNwb3J0cyBpbiB2YXJpb3VzIHNpdHVhdGlvbnMgYW5kIGRlc2lyZSB0byBhZGQgb25lDQo+
Pj4+Pj4gbW9yZSB0cmFuc3BvcnQgdGhhdCBwZXJmb3JtcyBpdHMgdHJhbnNwb3J0IGxheWVyIG9w
ZXJhdGlvbnMgYnkgc2VuZGluZyBhbmQNCj4+Pj4+PiByZWNlaXZpbmcgbWVzc2FnZXMuDQo+Pj4+
Pj4NCj4+Pj4+PiBJbXBsZW1lbnRhdGlvbnMgb2YgdmlydGlvLW1zZyB3aWxsIG5vcm1hbGx5IGJl
IGRvbmUgaW4gbXVsdGlwbGUgbGF5ZXJzOg0KPj4+Pj4+ICogY29tbW9uIC8gZGV2aWNlIGxldmVs
DQo+Pj4+Pj4gKiBidXMgbGV2ZWwNCj4+Pj4+DQo+Pj4+PiBJZiB0aGVyZSBhcmUgbm8gY29tbWVu
dHMgaG93IGxvbmcgc2hvdWxkIHdlIGxlYXZlIGl0IGJlZm9yZSByZXF1ZXN0aW5nIGEgdm90ZT8N
Cj4+Pj4NCj4+Pj4gZm9yIGEgbmV3IHRyYW5zcG9ydCxkdXJpbmcgc3VtbWVyIHZhY2F0aW9uIHRp
bWUsIEknZCBnaXZlIGl0IGEgbG90IG9mDQo+Pj4+IHRpbWUuDQo+Pj4NCj4+PiBIb3cgbXVjaCBt
b3JlIHRpbWUgZG8geW91IHRoaW5rIGlzIG5lZWRlZD8gSSB0aGluayB3ZSBhcmUga2VlbiB0bw0K
Pj4+IHJlcXVlc3QgYSB2b3RlIHNvb24gZ2l2ZW4gd2UgaGF2ZSBwbGVudHkgb2Ygd29ya2luZyBj
b2RlLg0KPj4+DQo+Pj4gLS0NCj4+PiBBbGV4IEJlbm7DqWUNCj4+PiBWaXJ0dWFsaXNhdGlvbiBU
ZWNoIExlYWQgQCBMaW5hcm8NCj4+DQo+PiBJJ2Qgc2F5IGl0J3Mgb2sgdG8gcmVxdWVzdCBhIHZv
dGUuDQo+Pg0KPj4NCj4NCg0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMg
ZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBi
ZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVh
c2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUg
Y29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Ig
c3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K
