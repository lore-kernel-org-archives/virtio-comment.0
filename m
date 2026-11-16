Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=2 smtp.remote-ip=40.107.162.28
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794843806;
	b=ppXWCZFvQff1VvKMdY97PR+Zrvb9JWWY3MgzgoW8TDYUg+uDBtXjdp0UdoDHzLVC4fGG
	 atrz1cjf0VYhHu25qPeYZmUUPBkIn3Iw0HwvFUKXEBebMiGI6YeOmIzz4Ntxjbt/WdWby
	 SCCb30O1pdoq7MCYpM2tbLQS5oQd/iNLsRjw76SYO6KgNaPUeaFCnGOZJBcB0kovK886V
	 Yr1WkBAIJu+9YRiJ6FARSLbDInMYqJ/Gj/DcjxyXpbflGaPlQ9BgWPHC2e5+ANS7JvBZy
	 YjGoKhWUExcQYoaBzZDCzP4qvdIy91pAXTiXiV5fFPLjq8UEHnX/t1XqIq1kvWb8h1A==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843806;
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
	bh=I1MMew4/kg2B+s0twkDHEBawZsgk4U/pttmDBSGd/0Q=;
	b=iatIQsb3WF8M2s6g5DmOCV7/A5AY9styyOy4myScJsggJTQlhqJ+WBtGkxIL1eRDPzWK
	 xOiUxwNUBAWCPZrmAUEgxAAZtrhRmSiThO27CHTsQaB6IVZZog9eA0LKRDTlnEX0AJX15
	 D4+/o3Zo9CBmkpdC2fFi5lY8VvN21evoeCYf3vIo9VOWe+mCkrdZ2MCLR3C+zFvww/PEA
	 jA63Umw0A8yYyH9AnkEa6B/Zx1jCVke1GQXxAKnOeN2e1BroXtWWybZ+AsF7dNA7K5XkI
	 RNVNiM2IdWXuYh8uleSZVKM9LvjsFXhc3Yjrv2QhJpFZ3IIbAfkpL/oQUZV7kAWk5rQ==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Gz2NIUqB;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Gz2NIUqB;
	arc=pass header.oldest-pass=2 smtp.remote-ip=40.107.162.28
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013028.outbound.protection.outlook.com [40.107.162.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C57606A329
	for <virtio-comment@lists.linux.dev>; Mon, 16 Nov 2026 15:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C57606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Gz2NIUqB;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Gz2NIUqB
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=l637Xi5LcGPG1IFs6HNCHb/cQA1Za8b1+KrdgN29xuZZuTuL2CurZ+aQlg4Al2luqqqkgR+BZ0iab1bovJrRmIMN5zsMhzOo2k28tnbgZgkmKBZyf9Al6gxKorS2VTq/oCjIPkQEAkdeOHBt9qty7DY3qRsCwHJghBKlhJ4A9oaOiNqvU4uKPYDNn01f2lF0Yns5am4VPQhMYEmGgR864gt+nBX9V4g3TLdgD8jJCKqOSkbUBuN33xDMNVEmSd8omPuQDQkJUGejHGNGPCgVTiv55j82iid+avGDVrykrFb5vDPyheEYgQeXksI1T+j75TCVpXNNZ0j9GPpFbnZt8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1MMew4/kg2B+s0twkDHEBawZsgk4U/pttmDBSGd/0Q=;
 b=fd96WESyNQvdmvC8/gJ7Pa+Q4+omQkRTj7nuKDyDdYrJowy8C+qWq/pRKnQuG4RA3BUIyXolJPZQ320j+SXd5lddtpEoBa7SXzn5mCIOBWengRWozWR4qcRtVXCrcT3QgkqozI8McVZUh1Sta0DGJKKuVKvEsUqwnOVxCWIQzdFy/UNKUuY/UCFO+Ej3AV5pY2rmMv0W+pyE7xJewaSI/H/iksHPIC/RnJsi6eNTPdsfxgMYS5zl3JHZAf6YAjZFt7XXX4x37+n90GN8aReVzankQhsZkOIxDhqqos9ROILJYsiZMd4eGiL/9TDDzQb3cwbf4Fv+ygRi2glrk6ZS1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1MMew4/kg2B+s0twkDHEBawZsgk4U/pttmDBSGd/0Q=;
 b=Gz2NIUqBvNrYFmvri2eqnBK15hNOPjtolj4v2crN9R7r7ppP2zPU2Dwerf2mF6vG9CV7ddMEjsHcimnB1t6iPzb3ve47Qi016bUMPuXCAIR8G5pBECZ6WhyKb4cYA+ohAfnRMWLLNsHMevxhyoxzeTDQYrwAn2DRZdrDStyzhnI=
Received: from AS4P190CA0005.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::17)
 by AM5PR08MB201416.eurprd08.prod.outlook.com (2603:10a6:20b:7d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:43:22 +0000
Received: from AM2PEPF00070CF2.eurprd02.prod.outlook.com
 (2603:10a6:20b:5de:cafe::12) by AS4P190CA0005.outlook.office365.com
 (2603:10a6:20b:5de::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 15:43:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF00070CF2.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 15:43:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C74QDomqU5qMSwoAcdyWFlFilyPpoHickveAcqvvy5hKGWCw4xo1F/Lj8RaHqyrWrOFDst07dDBlQmHT2oyKJwjtnxC5WGg/dadKw+i2siiYMQmO/jY8iEhKKeIgMDU86sGGy6uZbWRK7QAJ1eCs4+xGoe1WCI8BJaoZ6ju0h4uYj3utbgV2nS+xvIM5NQtOiByB27R5O9Cm5KZs9kRoq2MqXfQyR5OUX57I9ewm3bPO4SD/n6mfa6Ihh/KlWv2PuANaFMfFXvysTfLRT1cSAVE1R0aF8Pr4+Fk+jvF+1ItnXqiHqpMKjTQIexVBt8qAfEFNvbfF+n69EL6Ez6oKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1MMew4/kg2B+s0twkDHEBawZsgk4U/pttmDBSGd/0Q=;
 b=F9/BFSao/8kWRFH48tFGV7bFMwJENdJtcNoimZZBg0W5mkvI/v3OjpjdnBu7cYdij+6jT1g+gy9Hv3YWkKv1xRZs7mcaX1YqCmkfXysl8HWjMstMHvTPVjOkXSWo1FRM6F+8280TF4gvHuFIR4/di4wR2VTbJz+6dUJKqqSsh31vS0fsa0gYyLhdFkW8UO8hf/WqHYbzV3vTV3ili/eGncRjzaqNwHtGHPFDlBwN5QJCgj3AVfaxqkIqSK17wqCZcjuYKzxLlbpPd6+h6PtiTmorz1oqsuqVSMLttYB/4kAG6o0qGN4twQZsJU1WRuyfsE6CCCauX3IS8OEslXRbHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1MMew4/kg2B+s0twkDHEBawZsgk4U/pttmDBSGd/0Q=;
 b=Gz2NIUqBvNrYFmvri2eqnBK15hNOPjtolj4v2crN9R7r7ppP2zPU2Dwerf2mF6vG9CV7ddMEjsHcimnB1t6iPzb3ve47Qi016bUMPuXCAIR8G5pBECZ6WhyKb4cYA+ohAfnRMWLLNsHMevxhyoxzeTDQYrwAn2DRZdrDStyzhnI=
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com (2603:10a6:20b:c7::11)
 by PAWPR08MB11438.eurprd08.prod.outlook.com (2603:10a6:102:50b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:42:49 +0000
Received: from AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83]) by AM6PR08MB4754.eurprd08.prod.outlook.com
 ([fe80::a011:ffac:e18d:5d83%3]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 15:42:48 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar
 E . Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>, "Bill
 Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>
Subject: Re: [PATCH v2 3/6] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
Thread-Topic: [PATCH v2 3/6] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Thread-Index: AQHc/KbrLb2oCNZ/z0uhLLNGYVUYabctDlkAgAS6kAA=
Date: Mon, 16 Nov 2026 15:42:48 +0000
Message-ID: <2C9AD15B-D88E-4FDA-9D28-E47B2295B261@arm.com>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <a375ad8958031fdfd3dc483812ae0231d64c2cb5.1781514628.git.bertrand.marquis@arm.com>
 <b65955a6-d17e-4712-940f-447d068545de@kernel.org>
In-Reply-To: <b65955a6-d17e-4712-940f-447d068545de@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB4754:EE_|PAWPR08MB11438:EE_|AM2PEPF00070CF2:EE_|AM5PR08MB201416:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dfd15b5-72cc-4979-1b89-08df43f857dd
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|261009223027099003|3023799007|4143699003|56012099006|5023799004|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261026135527099003|261026130827099003|261021121427099003|261022105027099003|261021123027099003|261022113327099003|261022075727099003|261021130227099003|261021133027099003|261022115727099003|261021135927099003|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 u4IvjJNhi9Ff3n0wh2POz2XiMrQOj0QxjAUIzRVpqCadzVeLiSF599k6J/ndt9yEeWwB2vfWe1u//bQo0HhXp1pmj0PnMBSvZ4Yn5H1q4nbBjDlZmnCoSfCQAlHJuqIB7nDtw4PO5z78m3vAIL/hmk8QS1Jh2npe6mIWKPrmgFUCBWd4aYzlEBtaZFaG+cPJHxcqx8vVJj0NGK+keJGfShvWc7aRDrRP8Q1XFo31EW7cGZX4VpIHgIhDnbeWw5TcNv5AZWqMNgmF1cCca1XSQ73srX2E2DA6YPGXX2Jj6MYqHX4yXXGXwBv9FFvwnbvGHncm2yPHfVbI3ogdju9J5bRgkn3/N7V6wkS9MVs6Zl17Vph39VDTokQ/fv3BcWtf7tE5Puc2QaL8NjCJSJjkVKWpo1b8v+zy8tFxSBcUv++f6bn19Uc5h6JMHpAkI6KqChprFjv6EVBc9v6maOoLmjMXiTo5N5iWabVXAyTuoxaeXNm42fXvR3Bu85jU3XdfOXem6wNfHCMlUrdsomopdYlSnwdqOjxP2+Au/zDMtS+KmynjIuHdpUWperC8e25cI5Fvm8u4ZilfT4a8teKVBxty2Et3MFHkVq7/XSjGgpBevOTVWInV3h1T3BkaOEPkjSAaYNxnaLVPTAcfuXZi84VoTokauHT/Jc7f84NNuhqPdT6Fg5uy7X19c1BeohQNsg5sbQIndB97p9l7kj5unMJmo9KrqbmIpq3UXiul5ns=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(4143699003)(56012099006)(5023799004)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261026135527099003)(261026130827099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022113327099003)(261022075727099003)(261021130227099003)(261021133027099003)(261022115727099003)(261021135927099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D5FDA231264DF24A8A9B8D07A199CDAA@eurprd08.prod.outlook.com>
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
 Du/w4kyuB+EMOvHzfCSWaZpMN/HZ2bSD/SIP1JNSGF8RtBvFrzVldrn4dilEjFbdXW/S3DEuNKtJCVocu96NYkQ/aELbM9ADLDHQZNtkGZ3q156rjKnEv2zBj1padO24NojyB9lE/HiGKcEpz4rv+KnVP7imxIIPnNFfB+es6Bmlymi8YF6+aIyRVv9Z6PfgeNoikjdDvfrPhm8httlx3nrsWbbzUAQY5HwgEonmd98nWlEmLCgOofZaHAT9de0CIg4fHpIxI/jhEPsv/rIYLEMDQ4HmHWxGh8itG6PKJ8uMlnAoSlJBtNxss5w2igVLghWHMtw/bk7JbPzEgr//eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11438
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF00070CF2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	92555571-9199-4b93-59f2-08df43f8446e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|14060799003|36860700016|35042699022|23010399003|6133799003|261009223027099003|18002099003|22082099003|3023799007|261026135527099003|261026140227099003|261026121527099003|261026130827099003|261021130227099003|261021121427099003|261021123027099003|261021135927099003|261021133027099003|261022113327099003|261022115727099003|261022075727099003|261102123227099003|261022105027099003|261028144727099003|56012099006|4143699003|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	3O55e/DDPZAX/yCSYkT1KX8ifY8HtVxhpHxwUx+2X83DvkXzhX1HuCptN4gxrNdda7hn9F/ffTxjPnb4Yd9p+SjHUl+Sulf+EotjNOkCXECtdHu3JWO2/voVjj4nNGM6lVN7vPn9hPc+azCkbCicw0LIRrSM8GIK0qH45aqfb7SGpEzF8CPnaKOLAq2g8hNH3vAuEGJpq1EWktk5MmI/ztqLMnRubeoiFPI/IOfmjojBrwDw4OXpNyf62LzNMogsCcxl03z1WKVFIIz42LEds+dnyUYfKtPzUrTJ5pa2+fo7zlBhYJza87LClK6zWmK5WqOrJ/b+IAuuhcjZtkyJYvYuZeN5VP79qxt8mkhHHpwBqSsGD/+SsSj/hX/z+t/9e9VFsfsa/J6rE8h2YZXG49M1+3Za2xGJETh1kF9ki2AvviS8ePh9h8m6aPGZUlTqU13NBJuD3w1Ip24c3TKXKkzVXruAQhDcJNeluXSaCUDWqKP4VKpVniCZlkH7sldSwLOFflOKpdvA21XfeF/AEJ1nJKBcH/gy8sjbSmYeaBbJ0k6NG3BzDgT1+3jG81YgiUHKT4mO2krz5lWhSEsBNrTxMNkR5L2k1skJI0BVZCkNRzUmcj1VB3qPMHo2Yb1VbCX27CTz8P1dTHBXUQYrFiZNaEHFdBbXkggrNx7Si82FqmXODYrxWaJ6p6mx4lhjvqK//xfD6Tv9s3LD7sPmSQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(14060799003)(36860700016)(35042699022)(23010399003)(6133799003)(261009223027099003)(18002099003)(22082099003)(3023799007)(261026135527099003)(261026140227099003)(261026121527099003)(261026130827099003)(261021130227099003)(261021121427099003)(261021123027099003)(261021135927099003)(261021133027099003)(261022113327099003)(261022115727099003)(261022075727099003)(261102123227099003)(261022105027099003)(261028144727099003)(56012099006)(4143699003)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oDHjPc5DHs83WSZn7rjtR7t7lizO35jJABEbjkrkGfJAsnF6zoGuZYLEobV9Gs0BfMMX4v34TXqcRYKMvVetcrvh2XiYWfqoVQFzJTd4cDZVBU0tD5bHS5CO1LMOZUFVVQ1xoj3xfcriDxfqNABt34DcjpUkTARGOonMIyI4ZwImI2HA4HBlrcGR/aiy9ybMzXjiBT4Xm3K3Rx5XdA4btmmHYtigo+tBjrA26Y6QKfpzELZzDUIIvPyDEUpOYC08lNqpMPIFqs1ahHOxzYYnexGR217xohq/vY5GPbZTW5bEujZaOoW1NIeaqICcNNVOu9bbpy8oe4w+K/TyUZI1pKkksRBbPFynpMczBX7kZ81dOZKrfSJxZwQUWeYTYy2GRd2GqNB+jZ4hUGy6sR5HE9AxNAoTzcEoOIYmdEofT4UozqGHGaNXT1vXYJI8z37H
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:43:21.2199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dfd15b5-72cc-4979-1b89-08df43f857dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR08MB201416

Hi David,

Thanks a lot for your comments.

> On 13 Nov 2026, at 16:29, David Hildenbrand (Arm) <david@kernel.org> wrot=
e:
>
> This is pretty impressive work.
>
> In general, this looks very good to me. Mostly nits and some questions on
> added/removed events.
>
>> +\busnormative{\paragraph}{Bus Message Implementation}{Virtio Transport =
Options / Virtio Over Messages / Basic Concepts / Relationship between bus =
and transport / Bus Messages}
>> +\begin{itemize}
>> +  \item A bus implementation MAY support any subset of \busref{GET_DEVI=
CES},
>> +        \busref{PING}, and \busref{EVENT_DEVICE}.
>> +  \item If a bus implementation supports one of these bus messages, it =
MUST
>> +        conform to the normative definition for that message.
>> +\end{itemize}
>> +
>> +\busnormative{\paragraph}{Transport Message Forwarding}{Virtio Transpor=
t Options / Virtio Over Messages / Basic Concepts / Relationship between bu=
s and transport / Transport Message Forwarding}
>> +\begin{itemize}
>> +  \item A bus implementation MUST validate the device number in each tr=
ansport
>> +        message before forwarding it.
>> +  \item A bus implementation MUST relay each transport message to the d=
evice
>> +        number identified in the message header, regardless of how it
>> +        discovered or enumerated that device.
>> +  \item A bus implementation SHOULD treat transport messages as opaque =
apart
>> +        from enforcing generic transport limits, such as the advertised=
 maximum
>> +        message size, and SHOULD NOT modify the transport payload.
>> +  \item If a bus implementation cannot validate or route a transport re=
quest
>> +        that expects a response, it MUST surface a transport-visible fa=
ilure
>> +        for that request.
>> +  \item If a bus implementation cannot validate or route a one-way tran=
sport
>> +        event, it MAY drop the event or handle it according to
>> +        message-specific bus requirements.
>> +\end{itemize}
>> +
>> +\subsubsection{Known Bus Implementation Examples}
>> +\label{sec:Virtio Transport Options / Virtio Over Messages / Basic Conc=
epts / Known Bus Implementation Examples}
>> +
>> +This subsubsection lists informative examples of bus implementations an=
d related
>> +work for virtio-msg.
>> +
>> +\begin{itemize}
>> +  \item \textbf{Virtio Message Bus over FF-A}: specified by Arm in
>> +        \hyperref[intro:FFA-BUS]{[FFA-BUS]}.
>> +  \item \textbf{Virtio Message Bus over PCI for AMP}: under development=
; proof
>> +        of concept:
>> +        \url{https://github.com/wmamills/hvac-demo}.
>> +  \item \textbf{Virtio Message Bus over Xen grant tables and events}: u=
nder
>> +        discussion.
>> +\end{itemize}
>
> I don't know if it's common to include such PoC/discussions in the spec. =
I'd
> have moved that to the patch description. In any case, it's very helpful =
+ nice
> to see how this will be used.
>

As the transport needs a bus binding to form a working solution,
we thought concrete references would help readers understand its
intended use. I would prefer to retain references to documented
bindings in the specification, since they remain useful beyond
review of this series.

The prototype links and work under discussion could move to the
commit message. Would that address your concern?

>
>> +\paragraph{virtio-msg transport revisions}
>> +
>> +The following table lists the currently defined virtio-msg transport re=
visions
>> +and their protocol-defined maximum message sizes. Transport feature bit=
s are
>> +defined separately in
>> +\ref{sec:Virtio Transport Options / Virtio Over Messages / Basic Concep=
ts / Transport Feature Bits}.
>> +
>> +\begin{tabular}{ |l|l|l| }
>> +\hline
>> +\field{revision} & \field{maximum size} & remarks \\
>> +\hline \hline
>> +1        & 52-65535    & Virtio Message Revision 1 \\
>> +\hline
>> +\end{tabular}
>
> Not sure if that table really adds a lot of value, hard to tell what else=
 should
> be mentioned if there is no rev 2 yet. But maybe that's just the common w=
ay of
> doing it.

I agree that right now it does not add much value. The idea was to have
a placeholder if a revision 2 is needed to introduce new messages or
functions.

I can replace it with a simple sentence defining revision 1 and its
message-size limits, with the separate 264-byte recommendation.

>
>> +The table reflects the protocol-defined maximum size; the recommended
>> +advertised maximum remains 264 bytes for interoperability.
>> +
>> +Note that a change in the virtio standard does not necessarily
>> +correspond to a change in the virtio-msg transport revision.
>> +
>> +The maximum message size is specified from the transport-layer point of=
 view
>> +and includes the 8-byte common header plus payload. Any extra encapsula=
tion
>> +imposed by the underlying bus (for example, a framing header) does not =
count
>> +against this limit. Today the largest practical inline configuration pa=
yload is
>> +244 bytes: messages such as GET_CONFIG and SET_CONFIG use 12 bytes of
>> +message-specific fields, leaving up to 244 bytes for device configurati=
on data
>> +in one transfer when the recommended 264-byte maximum message size is u=
sed.
>> +Larger configuration regions can be accessed through multiple exchanges=
 without
>> +requiring a larger per-message limit.
>> +
>> +\busnormative{\paragraph}{Message Size Bounds}{Virtio Transport Options=
 / Virtio Over Messages / Basic Concepts / Revisions / Message Size}
>> +\begin{itemize}
>> +  \item A bus implementation MUST advertise a maximum message size of a=
t least
>> +        52 bytes.
>> +  \item A bus implementation SHOULD NOT advertise a maximum message siz=
e that
>> +        exceeds 264 bytes (256-byte payload plus the common header).
>
> Ah, that points back at the recommendation mentioned above.

Yes. The earlier sentence summarizes the recommendation, while
this clause expresses it normatively. I'll keep the two aligned.

>
>> +\end{itemize}
>> +
>> +\paragraph{Versioning and Forward Compatibility}
>> +
>> +A higher transport revision or additional transport feature bits extend=
 the
>> +protocol with new messages or capabilities. Implementations are expecte=
d to
>> +remain interoperable across revisions: devices and drivers designed for=
 a newer
>> +revision still implement the mandatory messages and semantics defined i=
n prior
>> +revisions.
>
> "are expected" -- do we want to make that stricter and turn it into a MUS=
T, or
> an informal "will", or what is the reason why this phrasing was chosen?

This was intended as an informative introduction. The driver, device
and bus compatibility blocks below contain the normative requirements.

I will replace "are expected" with more definite wording.

>
> Because below, I read a lot of "MUST" :)
>
> [...]
>
>> +Each virtio-msg bus instance contains zero or more \emph{devices}, iden=
tified
>> +by a 16-bit \textbf{device number}. The device number is a bus-assigned
>> +identifier and is distinct from the virtio device ID (device type) retu=
rned by
>> +\msgref{GET_DEVICE_INFO}.
>
> Good.
>
> [...]
>> +The 16-bit device-number space provides roughly 65k device slots per bu=
s
>> +instance. Deployments that require more devices can instantiate multipl=
e bus
>> +instances and distribute devices across those instances.
>
> :)
>
> [...]
>
>> +
>> +Some bus implementations may reject requests that violate their local p=
olicy
>> +or that are not valid for the current device state. In such cases, the =
bus may
>> +return a bus-specific error indication to the transport, which can then=
 surface
>> +that failure to the driver.
>> +
>> +\subsubsection{Endianness}
>> +\label{sec:Virtio Transport Options / Virtio Over Messages / Basic Conc=
epts / Endianness}
>> +
>> +Unless otherwise stated, all numeric fields defined for virtio-msg mess=
ages use
>> +little-endian encoding.
>
> Hurray :)
>
> [...]
>
>> +
>> +\subsubsection{Message Ordering}
>> +\label{sec:Virtio Transport Options / Virtio Over Messages / Basic Conc=
epts / Ordering}
>> +
>> +Transport messages fall into two classes: requests (which expect respon=
ses) and
>> +events (which are one-way). Drivers and devices do not interpret the
>> +\field{token} field directly. A bus implementation MAY have multiple
>> +outstanding requests for the same device number and MAY use the bus-own=
ed
>> +\field{token} field to correlate each response with its originating req=
uest.
>> +The device copies the received request token into the matching response=
, and
>
> yeah, that's a clear MUST. Is that covered somewhere and I missed it? (it=
's a
> lot of text for a Friday evening ...)?

Yes, this is under Device Requirements: Common Header. I'll add a
reference from Message Ordering to make that easier to find.

>
> [...]
>
>
>> +\msgdef{GET_SHM}
>> +
>> +\msgref{GET_SHM} returns the location and size of a device-owned shared=
 memory
>> +region. The request carries the shared-memory region identifier
>> +\field{shmid}; the response echoes \field{shmid} and provides the base
>> +physical \field{address} and \field{length}. A \field{length} of zero
>> +indicates that the specified \field{shmid} is not supported by the devi=
ce.
>> +
>> +\begin{lstlisting}
>> +struct virtio_msg_get_shm_req {
>> +        le32 shmid; /* shared memory region identifier */
>> +};
>> +
>> +struct virtio_msg_get_shm_resp {
>> +        le32 shmid;     /* echoed region identifier */
>> +        le32 reserved;  /* must be zero */
>> +        le64 length;    /* region length (0 if nonexistent) */
>> +        le64 address;   /* region physical address */
>> +};
>> +\end{lstlisting}
>> +
>> +\devicenormative{\paragraph}{GET\_SHM}{Virtio Transport Options / Virti=
o Over Messages / Transport Messages / VIRTIO_MSG_GET_SHM / Device}
>> +\begin{itemize}
>> +  \item A device MUST return zero \field{length} if the requested
>> +        \field{shmid} is not supported and MUST report accurate physica=
l
>> +        \field{address}/\field{length} information for regions it suppo=
rts.
>> +  \item A device MUST set the \field{reserved} field in \msgref{GET_SHM=
}
>> +        responses to zero.
>> +\end{itemize}
>
> Don't we need some statements that the device MUST echo the shmid etc?

Yes, we need a device requirement for that. I will add one stating that
the response MUST echo the requested shmid, including when the region
is not supported and the returned length is zero.

>
> [...]
>
>> +
>> +\drivernormative{\paragraph}{EVENT\_AVAIL}{Virtio Transport Options / V=
irtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_AVAIL / Driver}
>> +\begin{itemize}
>> +  \item A driver MUST identify the target virtqueue in \field{vq_index}=
.
>> +  \item If VIRTIO\_F\_NOTIFICATION\_DATA has not been negotiated, a dri=
ver MUST
>> +        set \field{next_offset} to zero in \msgref{EVENT_AVAIL} message=
s. If it
>> +        has been negotiated, the driver MUST encode core \field{next_of=
f} in
>> +        \field{next_offset}[30:0] and core \field{next_wrap} in
>> +        \field{next_offset}[31], using split-queue or packed-queue deri=
vation
>> +        as defined by core virtio.
>> +\end{itemize}
>> +
>> +\busnormative{\paragraph}{EVENT\_AVAIL}{Virtio Transport Options / Virt=
io Over Messages / Transport Messages / VIRTIO_MSG_EVENT_AVAIL / Bus}
>> +\begin{itemize}
>> +  \item If a bus implementation cannot preserve
>> +        VIRTIO\_F\_NOTIFICATION\_DATA semantics for \msgref{EVENT_AVAIL=
}, it
>> +        MUST prevent negotiation of VIRTIO\_F\_NOTIFICATION\_DATA.
>> +\end{itemize}
>
> Don't we need some statements about the device setting the virtiqueue in
> \field{vq_index} etc?

For EVENT_AVAIL, the driver sets vq_index as required above. For
EVENT_USED, we are missing the corresponding device requirement.
I will add one.

>
> [...]
>
>> +
>> +\busnormative{\paragraph}{GET\_DEVICES}{Virtio Transport Options / Virt=
io Over Messages / Bus Messages / GET_DEVICES / Bus}
>> +\begin{itemize}
>> +  \item The responding bus implementation MUST interpret \field{count} =
as a
>> +        number of
>> +        device-number slots and MUST return a \field{bitmap} of
>> +        \textbf{(\field{count} + 7) / 8} bytes, packed least-significan=
t-bit
>> +        first.
>> +  \item A request with \field{count}=3D0 is valid. In response to such =
a request,
>> +        the responding bus implementation MUST return \field{count}=3D0=
 and an
>> +        empty \field{bitmap}.
>> +  \item The responding bus implementation MUST NOT return a \field{coun=
t} value
>> +        greater
>> +        than the \field{count} value from the request.
>
> Is that early line break intentional? I assume not :) (latex won't care)

No just some weird wrapping on my side. I will improve that :-)

>
>> +  \item If \field{count} is not a multiple of 8, the responder MUST set=
 unused
>> +        bits in the last \field{bitmap} byte (positions at or above
>> +        \field{count}) to zero.
>> +  \item For a terminal response, the responding bus implementation MUST=
 set
>> +        \field{next\_offset} to 0.
>> +  \item For a nonterminal response, the responding bus implementation M=
UST set
>> +        \field{next\_offset} to a value strictly greater than the reque=
st
>> +        \field{offset}.
>> +  \item Responders SHOULD return the requested \field{count} unless con=
strained
>> +        (e.g., by maximum message size) or when trailing parts of the r=
equested
>> +        window contain no present device numbers; if a smaller \field{c=
ount} is
>> +        returned, the \field{bitmap} MUST still represent the window de=
fined by
>> +        the echoed \field{offset} and \field{count}.
>> +  \item If no devices are present in the requested window, a responder =
MAY
>> +        return \field{count}=3D0 with an empty \field{bitmap}.
>> +\end{itemize}
>> +
>> +\busdef{PING}
>> +
>> +\busref{PING} is a simple liveness check that can be sent by either sid=
e of the
>> +bus; the response echoes the 32-bit data value from the request.
>
> Why would one need a liveness check and when do we expect them to be used=
? How
> frequently?

The intended use is to check whether the peer bus endpoint still
responds. We have deployments where independently running systems
communicate, and one may stop without otherwise notifying its peer.
PING can help detect that situation and trigger recovery.

PING is optional. Its use, frequency and timeout are determined by
the bus binding and deployment, normally within the bus
implementation. A successful response does not establish that
every device behind the endpoint is healthy.

I'll make the purpose more explicit in the specification.

>
>> +
>> +\begin{lstlisting}
>> +struct virtio_bus_msg_ping_req {
>> +        le32 data; /* arbitrary value chosen by the sender */
>> +};
>> +
>> +struct virtio_bus_msg_ping_resp {
>> +        le32 data; /* echoed request data */
>> +};
>> +\end{lstlisting}
>> +
>> +Drivers or bus implementations can use \busref{PING} as a liveness chec=
k. If a
>> +reply is missing or delayed beyond local policy, the initiator can veri=
fy
>> +device status (for example, with \msgref{GET_DEVICE_STATUS}) and perfor=
m
>> +recovery as needed.
>> +
>> +\busnormative{\paragraph}{PING}{Virtio Transport Options / Virtio Over =
Messages / Bus Messages / PING / Bus}
>> +\begin{itemize}
>> +  \item The responding bus implementation MUST echo the 32-bit data fie=
ld from
>> +        the request exactly in the \busref{PING} response.
>> +\end{itemize}
>> +
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
>
> Is there no "REMOVING" or "Request for removal" request mechanism?
>
> Other unplug mechanisms (iirc ACPI) avoid this kind of surprise removal, =
as it's
> not particularly nice to handle.
>
> I guess for such surprise removal, any concurrent message to the device w=
ill
> silently get lost? Or how is that supposed to work?

We currently have no pre-removal handshake. REMOVED reports that
the device is no longer accessible. The intention is to leave
graceful removal sequencing to the bus binding.

For requests expecting responses, the existing requirements mandate
completion with either one protocol response or a transport-visible
failure under a bounded completion policy. This includes requests
already outstanding when removal occurs; the bus does not need to
manufacture a protocol response. One-way events have separate
delivery rules.

I'll clarify how these requirements apply during removal and make
the transport/bus responsibility split more explicit.

>
>
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
> What if we get a fast sequence of ADDED+REMOVE, REMOVING the device while=
 still
> probing the driver etc? Isn't that a concern if it's architected like tha=
t?

Yes, removal can race with probing, and the current text does not
explain the required handling sufficiently.

I think the bus/transport integration needs to serialize probing
and teardown, so removal cancels or invalidates an ongoing probe
and late completions cannot finish binding a removed device.

We also need clear rules preventing stale requests, responses or
events from affecting a replacement device using the same number.
I'll work through those requirements and clarify what each bus
binding must guarantee.

The reference to PING here is misleading: it cannot resolve
reordered lifecycle events or distinguish device lifetimes.
I'll remove that claim.

>
>> +
>> +\busnormative{\paragraph}{EVENT\_DEVICE}{Virtio Transport Options / Vir=
tio Over Messages / Bus Messages / EVENT_DEVICE / Bus}
>> +\begin{itemize}
>> +  \item A bus implementation that sends \busref{EVENT_DEVICE} MUST set
>> +        \field{device\_number} to a valid bus device number exposed to =
the
>> +        driver side.
>> +  \item A bus implementation that sends \busref{EVENT_DEVICE} with
>> +        DEVICE\_BUS\_STATE\_ADDED MUST do so only when the referenced d=
evice is
>> +        accessible for transport-message processing.
>
> Right, but what prevents immediate removal?

Nothing prevents immediate removal, particularly following a fault.
ADDED means accessible when announced; it cannot guarantee continued
presence. We need to specify safe handling of subsequent removal,
including during probing, as discussed above.

Cheers
Bertrand


>
>
> --
> Cheers,
>
> David

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
