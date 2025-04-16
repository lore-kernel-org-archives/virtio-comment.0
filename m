Received: from egress-ip42a.ess.de.barracuda.com (egress-ip42a.ess.de.barracuda.com [18.185.115.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1A17A304
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809611; cv=fail; b=Q94d1m5d7/eu8sXiKN6/QmJdlgthcYcEopgxxiEBD8mG0fqMrcDSXWwt/npJhCKKp7ULdVc2xJa+KA9XvBn8lxuBEkQVPFzRexmC6ZXgFm3v6K2ieJJYuOmzCtbYGDCqF7NPLnQKLw80JgfO8RI7BTlViPLCHH85HkkYP/XZD8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809611; c=relaxed/simple;
	bh=aT7jokHG0mK7uK7W1IQzYUvGkNIGATjR5dNLHFOk9w4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GXFuPZP/0i6+eUnTwDeyrG4k2x37ea+tHPznl6MWtHQaDxoSnbZFQtnNmxBxMNBP1fr/ZT4Qsjb50Q/Ld1t3xBjst1FHs5TqfuGFb0J1lCbw3lz3pu6g3SnR5OMppPkn3vMP0epp+ylJ2el/GJmKZ5j2UyW9QBQQTo3A0jJBRVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=napatech.com; spf=pass smtp.mailfrom=napatech.com; dkim=pass (1024-bit key) header.d=napatech.com header.i=@napatech.com header.b=qFwJbFXC; arc=fail smtp.client-ip=18.185.115.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=napatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=napatech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=napatech.com header.i=@napatech.com header.b="qFwJbFXC"
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03lp2113.outbound.protection.outlook.com [104.47.30.113]) by mx-outbound14-97.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 16 Apr 2025 13:20:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9XoXPxci1+cVFeytTrmZd6WBkrEzGYrlD156DnkvT3wC62XzbA7QgT5At8UVwZu5sd52fgSdnKIV2JhAW8MANnWrO68WgLgehVE+VefQnGTAw4d99GqP5FtyvOKms4vfD3fXvPQNlTQNgvc4JlJ3jbZw4VWGb4XNRIR40+Li871lm3M0QFWsruC/WRIRLA0HAPSAkOCHBQvtij0H1E/XakfQYfWVA8KbTPSGAuNtq8D6+EZ7wzfgeJMK13GbZkNnEFN3o32gxIeADV+bjMvAfX9YY1UkacO1yrYU5SnfKr6zM8l7jlsQW7+4ueNKOt+fgZBvrlKBPknVKqGQU0u7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aT7jokHG0mK7uK7W1IQzYUvGkNIGATjR5dNLHFOk9w4=;
 b=CmctT6FrycgoVK6G94NbbvV8UazEDetZ+Hdch4F/9/W3gkEMJLJyXa/YdGuOVqrAy85bdtjPEltlNOcpOCoiCbKE5ZWKsrYoEjGClClSmgOATu0Qk2fLoaa6rx79zOLIWtil4Z5nROeWVxqvJlak55PrFe2oLQgcvyH+SyjvCLTMUpFjYGSKKf2KVM5Ka3C1m5f0UxMpANxsVT+XV+eO+Ydh/XDxT/if5zf/1omSwPSuBzMEJjV1SYI8XC9eHYvjUgmB4c1QAz0pMKRxSlJn0CDr5MjnNrmQws5TIIlvco9LNbGnkYfIsbRTbNKtQpew/sMdBmosgjvGlGrgfSzzfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=napatech.com; dmarc=pass action=none header.from=napatech.com;
 dkim=pass header.d=napatech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=napatech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT7jokHG0mK7uK7W1IQzYUvGkNIGATjR5dNLHFOk9w4=;
 b=qFwJbFXCEGZbF94/+qLNfsmO96PH/jx5ZN5Rt+ChxK3V4L2Nx5pxamt4ooEkeOqirQTB4n6ktpeNEZJKWmbN5rpvkIvNhQ1Ebxj4Mpjyz2rL0j/lfBQaWrvQA4cMUG7H7/TeaFx2VbXn5S9Def2pSqplXaAYrClPu+HvsqNqRcc=
Received: from HE1P190MB0265.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:55::22) by
 GVXP190MB2075.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:159::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.36; Wed, 16 Apr 2025 12:44:15 +0000
Received: from HE1P190MB0265.EURP190.PROD.OUTLOOK.COM
 ([fe80::b7ef:5ac7:b684:bfee]) by HE1P190MB0265.EURP190.PROD.OUTLOOK.COM
 ([fe80::b7ef:5ac7:b684:bfee%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 12:44:15 +0000
From: Sebastian Mauritsson <sma@napatech.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"parav@nvidia.com" <parav@nvidia.com>, Satananda Burla <sburla@marvell.com>,
	Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>, Jerin Jacob
	<jerinj@marvell.com>, Shiva Shankar Kommula <kshankar@marvell.com>
Subject: RE: [PATCH RFC v4 0/4] introduce IPsec Operation in virtio-net
Thread-Topic: [PATCH RFC v4 0/4] introduce IPsec Operation in virtio-net
Thread-Index: AQHbqFqqkK8qfWXNO0itLjmjCd4BvLOkvyTAgAFbNoCAABwIUA==
Date: Wed, 16 Apr 2025 12:44:14 +0000
Message-ID:
 <HE1P190MB026554E9C3AD9DFC3A0DD1DBCEBD2@HE1P190MB0265.EURP190.PROD.OUTLOOK.COM>
References: <20250408073857.1783779-1-schalla@marvell.com>
 <HE1P190MB0265957E736DFC9597429820CEB22@HE1P190MB0265.EURP190.PROD.OUTLOOK.COM>
 <DS0PR18MB53686E9A5732AA2AAC0656FBA0BD2@DS0PR18MB5368.namprd18.prod.outlook.com>
In-Reply-To:
 <DS0PR18MB53686E9A5732AA2AAC0656FBA0BD2@DS0PR18MB5368.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=napatech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1P190MB0265:EE_|GVXP190MB2075:EE_
x-ms-office365-filtering-correlation-id: e1c81e83-9b8f-4284-ab15-08dd7ce46559
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NlZaY05MdVZCVEVWMUVtc1oyTkRibWJFazV2VHRNSk5iaXhLaEw4RVRuU1M3?=
 =?utf-8?B?RDlXc2RlaGFFd3pJY3V6MjRUR0pMQXhVM1MvSkZaOFYxZ0hvVkUyVW94bWI2?=
 =?utf-8?B?WHV4eHdBczNLbVU0b0tFSGRxUVIvREdqZjVHZmZFeEZTcjYyRXlkbURmSWc4?=
 =?utf-8?B?SVdFbnZoRzB0R1J4Vk83YStuZFBuSW9nUERWZy96TXNuREtYZ2htM0hiMDNN?=
 =?utf-8?B?YXR5WnFESEJaa04rbXYyMnBBdm50ZXUyUzgrenZ1WE9oTDlybGdpd1pmOVJD?=
 =?utf-8?B?eHpoOGdaaHdlNnM4L2NuNWFiNXphMTV5bjloT1ZXZWNDZ2NWWDhvZ1AySFJK?=
 =?utf-8?B?akZqeGtZRmJiRURpSFJsTThoUDBCMDY5bUNQU0JGUzk3QVhZT3NacGFzWnhH?=
 =?utf-8?B?R0l1TzY4elkwMDVSR1NGUldhejZHQUZGWnB5dkgvUWNJMEdzbnJzQ0NFenAr?=
 =?utf-8?B?ek5XNWZCWC90S25XbXhFSE1oN3pmNDAxNDgyVlFlZlhlSlQ4ZTdyNHhGTzNK?=
 =?utf-8?B?UVRoTHRSOEpaZjBZeTBFM1B1WmVRY3dJQkVKYnJKZjJBRlhCMjFGYzk4Q3U5?=
 =?utf-8?B?cWRrL2RPN0hsVGVoV3RZUHZ2ckxMNm8rbXZsekFSZFlKUk5KSkhReGtnVmhL?=
 =?utf-8?B?cHMrQkZrWGllNzBURUM3RkVnb0NhTUxoME8ybG5FQ0VkbkdkcXV0cm1XUzNn?=
 =?utf-8?B?U1lXdXR3c0hPNTlnZittdzZvaWkramVBTTIwcFAwU09NMmEzNndhTGZrazA1?=
 =?utf-8?B?TGo1dnJkeUY1SzNwTVNqSSsveVMrYS9jZEZORUZhcW0yNVhra3JNbHpKR3FW?=
 =?utf-8?B?bDFOV3RyYlAxMWVWeVM3azIyVEdHZFZIdFlSQ3pPb1ZQazJPRGVwVC9zdG1H?=
 =?utf-8?B?TEdDOVBEbm5yWWhwVFdXY0FFTSttenp0dHp2a3RYSzJZSm5NNTlhN1EvWng1?=
 =?utf-8?B?UGJQWUEzSUZHQjdBcjUrR0YzdVZUYS9FSmF4THJqWDBjUFBPNjcyemlmdVNL?=
 =?utf-8?B?RXRkRUcxTExoS2UybnByaFY5Y3ZPWng2OHZtUW5wNDhDc2xXWWhCOTFqbFVJ?=
 =?utf-8?B?VG9sYTV2QzJkelAzamw4L1dROEF5TmN3STcxTGhLdHEyRldZUGVsOHZ0b045?=
 =?utf-8?B?aWczZnFKL0REWjdDRDY2ckJNclRPMmN5YUVBb3RYUk85bC8zU2hXcWJHdUZD?=
 =?utf-8?B?dGRYbVVicWFrcDVMcndObThxVHhGaVV2V2daa1g4MHFWYk4wcUtKOGt1a0t1?=
 =?utf-8?B?RWlGeDRtS1M5VER5Qnd1SHVBY25PRkpwYUpLVnZyeGdWbG9rRXE2MjNHZkpT?=
 =?utf-8?B?Z0VFcnFzOUZjcUZFdnV0dXZsNTJiWmtnVFoyOHdKNmdjL1JJV0JoMVZqZWhX?=
 =?utf-8?B?SzVYdEMxZXhBdEtGZU90VkhJWDliUGUrOTJjK2pRU0FZWEhFSGs3OFpJWlBL?=
 =?utf-8?B?T1dVYzBZejBoa0M1V1hBWU5lcUxBNWlNcHdBTUdBQXNFSFZQRjVSSlFIVzl5?=
 =?utf-8?B?RnR6UXdsdmZQK2RNNlhPY2p1VGdDV0IrbDhDcXI4NU9UK1VEUlNMYnZ4VnUx?=
 =?utf-8?B?c3I2NU02L29NUEt3a21UMk5Wemhvd25xbVRXOCtzRmlFTHdtd2YrYnpPRXJk?=
 =?utf-8?B?eUNEUVR6c3Rrc2pmUUxyT01TeEpDVnlGNE10VXFsYTJZT1B0WnhRbEVMUWwy?=
 =?utf-8?B?STV0aDF3UVFkQzNZZ0J4S0s5NTg3dVJWNVVoZlU4NFBVdjNpRlE0aFMyazJS?=
 =?utf-8?B?dStycGNzZGptUFZ5Wkg1VG9kd3pUalBtR1FsaXZuNXZjN1lEeEVDaXlnTHAz?=
 =?utf-8?B?aWlmZ0ZoQTMwRUpOaXpYUlZBd0FMNGF6L1FEY0ZzaUUwaHloWXh1c1dFSG5a?=
 =?utf-8?B?d1cyWjFhcnZxUzd2U3Y1SkFMYVBiTmpKZGhEYTErYzlPUlRTQkdtZmp2aTNX?=
 =?utf-8?Q?uEflG8Yjbsg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0265.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDhuMUVLMXl3SGVsMXZPNDQrUktTSCtYSFExSkdPMFFuVmVyUGdJT0RXOUlM?=
 =?utf-8?B?VGdDdjdMallZeGtoakdBUTZMSjU1Mk05bFQ5b2IrRHJ3dUlUZ1EvdnpVcXFQ?=
 =?utf-8?B?RWNudnZvc1ZSREoxa292bVkzZ25nSVg1Q21uWmVDZjB4OExMaXJFaTV3WlpP?=
 =?utf-8?B?cHJpTDBzT1dWbGt6eTE3SkxyNGV1QnczbDVvaHZjbCthMSs4RUFtWXg2ajhN?=
 =?utf-8?B?V1Q5Wnh3TmttUDhFU3hDUStCY1FTOVBVMlMyYmJRS2h4NDV6dEU4RGVUa1gw?=
 =?utf-8?B?bDFWWlpkcXNFWUJHaWFoRHhRRzlOMUNkVy9zd3lWalZRck9aeUpMUnFvQk9k?=
 =?utf-8?B?OUVCV1k1bVE5Yno5TUtjdW9NSnBnRk5mYjBMNUtHeDJIUVRWNVRYaXhPTW13?=
 =?utf-8?B?YkxUbldIRjA1TGlUNDFmdld1RGFYU2FTSGJBYWN5ZVBzb2lwakdjbE1XYUUz?=
 =?utf-8?B?Qk54RGVId3JJOGM1eWU5bnVKR2ZUVVNPUEhKczFkb0VmZzFpREVyYUR0dnpm?=
 =?utf-8?B?bXYwalBUYlhnTnVyMzJyN2JXQXdaNzlEaXJuOFJwUzVSVU1QY2JUTU1LMEFH?=
 =?utf-8?B?QjJtZGtQSkV4V2VjSmVCKzRvZ2grRXRER3dTMHE1WnpWaS85ZFNUYzFFbjFE?=
 =?utf-8?B?dVJNTFd3QTFqOG95bnVnclQrdUw5UTYzRzJjRGNUUGFVc3F2eUkxVmdZdHBj?=
 =?utf-8?B?Wi9kOTV3S21kOXRFaFVnOGhVQkNxYm52SXZtTXZVT3pGS0J6VmFJU3Fta1Qx?=
 =?utf-8?B?MjJNN1hEdUUzU3BLR0EyaHR1NWtnTXZ3UlJwaFlLV1VIdHRtSlhORmhDV01P?=
 =?utf-8?B?ZmFaVWFYM1dGNEs4R1NWVmV1NGFUeUtuSlJkNUpLY2Q3VFgvcjRuWmcvdzNO?=
 =?utf-8?B?SUFCTTJjb1h6cEwxcXFHd0ZCWnFxY2pSQUFTSlNwSEJ5VG9mS0ttUTFRVkd3?=
 =?utf-8?B?RGhXK2NMU0pUVUpvcHVDalpGSmxuSTF2WVc0K1JPckx4OHV6dTVGNjQxTmNP?=
 =?utf-8?B?MGFYQ2RnMDhOV25maHM0UUE2SkY0VXhZcUxwblE3TTB5elYvVFFjY1h2Y0Na?=
 =?utf-8?B?ejlXVmJFamFra2U1aVpTMmQ1TldzOU9PSVBuQXBLTmplblNXblE3RlVDODBZ?=
 =?utf-8?B?cmNOanVsQ0gxRGVwb2MzeVJ0cDJORVBFRTBLZGdvZ2tVVjVsbFgxa2QzZFVs?=
 =?utf-8?B?cWc3L3ZPRTB6YldEWFR0QzlUSTdJTXVpSmcwT2lpNjU5OEgweitJYVdQb0pq?=
 =?utf-8?B?YnI3dWJXOTAvUHVxWk16bmpFREdSNWxBT2RleDJBdWd2aU05VGlBL1FicmJl?=
 =?utf-8?B?V3hHbjJHS203TU04SnA2MlByOG5JV1hGRzdUZEJCdDU0ZFFRbDRjeXNOLzhN?=
 =?utf-8?B?a2ZkRWl3ZTFZaEVPaFBsSjVyQmZpS1hiNHF2blNmd3dwYnFZMGpVcnVOcVVz?=
 =?utf-8?B?bldoN21yZWI0RzVyZktmdFJmc3JadWpTNXBBa3pBblhKcDdQYlp5Z3JyWEN3?=
 =?utf-8?B?bXRaTGlibktRM1JLY0M1b1FPZWFDQzdpQWRRQWtncTVqT2ZCQ1VyMnR4b2pM?=
 =?utf-8?B?VFZKdkxuLzMrNk1oQjhnVUliczBPd3hWYjJ0K2daYUxCOEJlTkxOUktSR01h?=
 =?utf-8?B?OC9oQmdFNnUrWjYrK2tuMmV5MWxuYVY2QmYrY3BaSlViTUtGcUg3U2ZRUnh4?=
 =?utf-8?B?NUNIN0VjVkladGpCWjRwOWJFOTd0dTk3VlpMeGNSTlBXYmEzWE1HRHBOaTk1?=
 =?utf-8?B?MXVUcUJIeWlxNUJMcWtKbnFJeEg0bTNUUC9ZeGs0TjFDam44VnE2WU1OYzhM?=
 =?utf-8?B?T2o0alFXSDB5VnIwMURtNDJ4QmJrOFZaQ2Z4Vkh4VzBIUjUrUVdXem45Ni9t?=
 =?utf-8?B?b1NqYjVyYlBxdjhIZysvNUdYeXlPUGFJMnZIcGRCMVdjWThXSDluaFB2OG90?=
 =?utf-8?B?Y3A4YkYvZURuU1VZYk5BWDg5Wk0yMTdBN25TcDUxRGtqVElKNFY4QkE1THpO?=
 =?utf-8?B?QVVIT0NhR1pKSGszQVZST0R3T1EyYU5LNFRzeXZlU0N3Kzl6bGdZakdtSTBH?=
 =?utf-8?B?SGhrZFlxdDdKUS91eDRjQnoybjVtMEU5VTFXUll2VXlWVHV5N3NneDRTTzJE?=
 =?utf-8?Q?oW60=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S9qwXnW5LkOtV82edcKNSyOIF3PwD4875etfe0XimoUKNb86ntYcGCheh5h7YfRNwFmCCNhoxIHGyS4RQTqUwzwNKPJIZj4uhciThRkx5RUNMpYIgxj8BkLMdhiB/QYMJcbPa5M65DZNPzVMqTOvY6QHz+9z7TWF++xkp0EEaapOauWOz16aXx5d6zpGE6x7G7jIuz4IUCPhEoUuPm7lTFkvtWDIckbi8a+OBaQbhtVfqj1L7yn8TEFDIKIq3SaAqCvNPHglpp8PVWFWKymepkEMUnliylTElz1X7p7WTny/6YcUGPYewvY1Ql+s6mONlknLMJTzFedTr5yOxRHspXyN/8TzoWK5P8EgJTCXZd13qn4XoaJlEZ4ms87x+nGOIS1d2r4ruQ/CBgwFc3R+Tk1eWuNpL7SHmIdtWvBGkIgt75+rXFWmWvptQF/aonXn2dNy14R3qcabvNd9JZC6N/7zMaO4vOR+wKAXFnaxgQ6QY4hRHluI6hVXQRd5IAo/P9hdUrA9aCU7lMjPffSV9RY5QZsehimUS75VWLT2Qwpy7ViUaFwvOh/MuRaghV/zc+2M6qMc8rqRUKDpMo837zvDL3211Qep34bhaj9S5fLvRtHULDDzn9/DugrHqxEOMjcOw6eINJx/iBiXqiaj8k6OAQu31JK+BMvvYcGewQ8=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0265.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c81e83-9b8f-4284-ab15-08dd7ce46559
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 12:44:15.1121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c4540d0b-728a-4233-9da5-9ea30c7ec3ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFxoO6TCWnmKhiJ09FVUqmiU6K6y8Oig4z8vd4zUiSoJ9MHrICx/lxbq+2gkj3mJ9Iyh2KcYCC2oFpTtFe7soA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP190MB2075
X-OriginatorOrg: napatech.com
X-BESS-ID: 1744809604-303681-7631-23704-1
X-BESS-VER: 2019.1_20250414.2054
X-BESS-Apparent-Source-IP: 104.47.30.113
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVmaGhgZAVgZQMDHZJNHUxMIyyd
	jQONEy1cTQ0iLRPMXczNLc1DLNzMJSqTYWAA27skBBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.263930 [from 
	cloudscan15-233.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 HTTP_ESCAPED_HOST      URI: Uses %-escapes inside a URL's hostname 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS113687 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, HTTP_ESCAPED_HOST, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTcnVqYW5hIENoYWxsYSA8c2No
YWxsYUBtYXJ2ZWxsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAxNiwgMjAyNSAxMTo1
NCBBTQ0KPiBUbzogU2ViYXN0aWFuIE1hdXJpdHNzb24gPHNtYUBuYXBhdGVjaC5jb20+OyB2aXJ0
aW8tDQo+IGNvbW1lbnRAbGlzdHMubGludXguZGV2DQo+IENjOiBtc3RAcmVkaGF0LmNvbTsgcGFi
ZW5pQHJlZGhhdC5jb207IGphc293YW5nQHJlZGhhdC5jb207DQo+IHBhcmF2QG52aWRpYS5jb207
IFNhdGFuYW5kYSBCdXJsYSA8c2J1cmxhQG1hcnZlbGwuY29tPjsgTml0aGluIEt1bWFyDQo+IERh
YmlscHVyYW0gPG5kYWJpbHB1cmFtQG1hcnZlbGwuY29tPjsgSmVyaW4gSmFjb2IgPGplcmluakBt
YXJ2ZWxsLmNvbT47DQo+IFNoaXZhIFNoYW5rYXIgS29tbXVsYSA8a3NoYW5rYXJAbWFydmVsbC5j
b20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggUkZDIHY0IDAvNF0gaW50cm9kdWNlIElQc2VjIE9w
ZXJhdGlvbiBpbiB2aXJ0aW8tbmV0DQo+DQo+ID4gV2hhdCBhcmUgeW91ciB0aG91Z2h0cyBvbiBo
YW5kbGluZyBNVFUgYW5kIGZyYWdtZW50YXRpb24gZm9yIEVTUCBwYWNrZXRzPw0KPiBXZSBkbyBu
b3QgcGxhbiB0byBpbmNsdWRlIHBvc3QgSVBzZWMgZnJhZ21lbnRhdGlvbiBzdXBwb3J0IGluIHRo
aXMgc2VyaWVzLiBGb3IgdGhpcw0KPiBzZXJpZXMsIHRoZSBkcml2ZXIgb3IgU1cgc3RhY2sgbXVz
dCBwcmUtZnJhZ21lbnQgdGhlIHBhY2tldCBhbmQgZW5zdXJlIHRoYXQNCj4gSVBzZWMgb3BlcmF0
aW9ucyBkbyBub3QgaW5jcmVhc2UgdGhlIHBheWxvYWQgc2l6ZSBiZXlvbmQgdGhlIE1UVSBsaW1p
dC4NCj4gVGhhbmtzLg0KSGksIHRoYW5rcyEgSXMgdGhlIHBsYW4gdG8gdXNlIElDTVAgUE1UVSBt
ZXNzYWdlcyBmb3IgdGhpcz8gKGFzIHJlcXVlc3RlZCBieSBSRkM0MzAzLCBzZWN0aW9uIDMuMy40
IGFuZCBmdXJ0aGVyIGRlc2NyaWJlZCBpbiBSRkM0MzAxLCBzZWN0aW9uIDguMi4xKQ0KPiA+IEJy
LCBTZWJhc3RpYW4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+
IEZyb206IFNydWphbmEgQ2hhbGxhIDxzY2hhbGxhQG1hcnZlbGwuY29tPg0KPiA+ID4gU2VudDog
VHVlc2RheSwgQXByaWwgOCwgMjAyNSA5OjM5IEFNDQo+ID4gPiBUbzogdmlydGlvLWNvbW1lbnRA
bGlzdHMubGludXguZGV2DQo+ID4gPiBDYzogbXN0QHJlZGhhdC5jb207IHBhYmVuaUByZWRoYXQu
Y29tOyBqYXNvd2FuZ0ByZWRoYXQuY29tOw0KPiA+ID4gcGFyYXZAbnZpZGlhLmNvbTsgc2J1cmxh
QG1hcnZlbGwuY29tOyBuZGFiaWxwdXJhbUBtYXJ2ZWxsLmNvbTsNCj4gPiA+IGplcmluakBtYXJ2
ZWxsLmNvbTsga3NoYW5rYXJAbWFydmVsbC5jb207IHNjaGFsbGFAbWFydmVsbC5jb20NCj4gPiA+
IFN1YmplY3Q6IFtQQVRDSCBSRkMgdjQgMC80XSBpbnRyb2R1Y2UgSVBzZWMgT3BlcmF0aW9uIGlu
IHZpcnRpby1uZXQNCj4gPiA+DQo+ID4gPiBUaGlzIHNlcmllcyBlbmhhbmNlcyB2aXJ0aW8tbmV0
IGJ5IGFkZGluZyBzdXBwb3J0IGZvciBJUHNlYyBPcGVyYXRpb24uDQo+ID4gPiBUaGVzZSBwYXRj
aGVzIGFpbSB0byBleHRlbmQgdGhlIGNhcGFiaWxpdGllcyBvZiB2aXJ0aW8tbmV0LCBlbmFibGlu
Zw0KPiA+ID4gaXQgdG8gaGFuZGxlIElQc2VjIG9wZXJhdGlvbnMgZWZmaWNpZW50bHkuIFRoaXMg
ZW5hYmxlcyB0aGUNCj4gPiA+IG9mZmxvYWRpbmcgb2YgSVBzZWMgcHJvY2Vzc2luZywgYm90aCBi
ZWZvcmUgdHJhbnNtaXNzaW9uIGFuZCBhZnRlcg0KPiA+ID4gcmVjZXB0aW9uLCB0aGVyZWJ5DQo+
ID4gcHJvdmlkaW5nIGlubGluZSBvZmZsb2FkIGNhcGFiaWxpdGllcy4NCj4gPiA+DQo+ID4gPiBJ
dCBpcyB1c2luZyBuZXcgdmlydGlvIGJhc2ljIGZhY2lsaXRpZXMgb2YgY2FwYWJpbGl0eSBhbmQg
cmVzb3VyY2UNCj4gPiA+IG9iamVjdHMuIEJlbG93IGlzIGEgc3VtbWFyeSBvZiB0aGUgY2hhbmdl
cyBpbnRyb2R1Y2VkOg0KPiA+ID4NCj4gPiA+IFBhdGNoMToNCj4gPiA+IFRoaXMgcGF0Y2ggaW50
cm9kdWNlcyB0aGUgZm91bmRhdGlvbmFsIHN1cHBvcnQgZm9yIElQc2VjIHdpdGhpbiB0aGUNCj4g
PiA+IHZpcnRpby1uZXQgZnJhbWV3b3JrLCBvdXRsaW5pbmcgdGhlIG5lY2Vzc2FyeSBjYXBhYmls
aXRpZXMgYW5kDQo+ID4gPiByZXNvdXJjZSBvYmplY3RzIGZvciBJUHNlYyBvcGVyYXRpb25zLg0K
PiA+ID4NCj4gPiA+IFBhdGNoMjoNCj4gPiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBz
ZWxlY3RvciBhbmQgYWN0aW9uIG5lY2Vzc2FyeSBmb3IgSVBzZWMNCj4gPiA+IHByb2Nlc3Npbmcs
IGxldmVyYWdpbmcgZmxvdyBmaWx0ZXIgYWN0aW9ucy4NCj4gPiA+DQo+ID4gPiBQYXRjaDM6DQo+
ID4gPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgbmV3IGZpZWxkcyBpbiAic3RydWN0IHZpcnRpb19u
ZXRfaGRyIiB0byB0bw0KPiA+ID4gc3VwcG9ydCBJUHNlYyBmdW5jdGlvbmFsaXR5Lg0KPiA+ID4N
Cj4gPiA+IFBhdGNoNDoNCj4gPiA+IFRoaXMgcGF0Y2ggc3BlY2lmaWVzIHRoZSByZXF1aXJlbWVu
dHMgZm9yIGJvdGggdGhlIGRldmljZSBhbmQgdGhlDQo+ID4gPiBkcml2ZXIgdG8gc3VwcG9ydCBJ
UHNlYyBvcGVyYXRpb25zLg0KPiA+ID4NCj4gPiA+IFRoZXNlIGVuaGFuY2VtZW50cyBhcmUgZm9y
IHByb3ZpZGluZyBzdXBwb3J0IGZvciBJUHNlYyB3aXRoaW4gdGhlDQo+ID4gPiB2aXJ0aW8tbmV0
IGRldmljZS9kcml2ZXIsIGltcHJvdmluZyBzZWN1cml0eSBhbmQgcGVyZm9ybWFuY2UgZm9yDQo+
ID4gPiB2aXJ0dWFsaXplZA0KPiA+IGVudmlyb25tZW50cy4NCj4gPiA+IFdlIGJlbGlldmUgdGhl
c2UgYWRkaXRpb25zIHdpbGwgc2lnbmlmaWNhbnRseSBiZW5lZml0IHVzZXJzIHdobyByZWx5DQo+
ID4gPiBvbiB2aXJ0aW8tbmV0IGZvciBzZWN1cmUgZGF0YSB0cmFuc21pc3Npb24uDQo+ID4gPg0K
PiA+ID4gVGhpcyBzZXJpZXMgcmVmZXJlbmNlcyB0aGUgVmlydGlvLWNyeXB0byBJUHNlYyBzZXJ2
aWNlIG9wZXJhdGlvbg0KPiA+ID4gY2FwYWJpbGl0aWVzIGFuZCByZXNvdXJjZSBvYmplY3RzIGRh
dGEgc3RydWN0dXJlcywgYW5kIGNyeXB0b2dyYXBoaWMNCj4gPiA+IGFsZ29yaXRobSBkZWZpbml0
aW9ucyB0byBhdm9pZCBkdXBsaWNhdGlvbiwgaG93ZXZlciB0aGUgYWRtaW4NCj4gPiA+IGNvbW1h
bmQgdHlwZSB2YXVsZSBkaWZmZXJzIGJldHdlZW4gVmlydGlvLQ0KPiA+DQo+ID4gcy92YXVsZS92
YWx1ZQ0KPiA+DQo+ID4gPiBjcnlwdG8gYW5kIFZpcnRpby1uZXQuDQo+ID4gPg0KPiA+ID4gZGVw
ZW5kcy1vbjoNCj4gPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/
dT1odHRwcy0zQV9fbGlua3Byb3RlY3QuY3VkDQo+ID4gPiBhcw0KPiA+ID4gdmMuY29tX3VybC0z
RmEtM0RodHRwcy0yNTNhLTI1MmYtMjUyZmxvcmUua2VybmVsLm9yZy0yNTJmdmlydGlvLTJEJmQN
Cj4gPiA+ID1EDQo+ID4gPg0KPiA+IHdJRkFnJmM9bktqV2VjMmI2UjBtT3lQYXo3eHRmUSZyPUZq
NE9vRDVoY0tGcEFOaFRXZHdRempUMUpwZjcNCj4gPiB2ZUM1MjYzVDQNCj4gPiA+DQo+ID4gN0pW
cG5jJm09cWVRMzhja2c5Q1Y5WFlqcTZsVE80ZUNTajJVT0kybjl5WXBxWjFld1pBS3BZMVR5TVBW
DQo+ID4gYUpHTHQ1b203RQ0KPiA+ID4gMVNhJnM9OG5HZC1BV3RySWtHQUZWd1RtSTFyaF9ESThk
RGFfaGJvMXlxdjMtcnRBWSZlPQ0KPiA+ID4gY29tbWVudCUyZjIwMjUwNDA4MDczNTEyLjE3ODM2
NDEtMS0NCj4gPiA+IHNjaGFsbGElNDBtYXJ2ZWxsLmNvbSUyZiZjPUUsMSxlMEgxTkcwYmdvT1hE
VGpkSU55Y2s4RXNRbzNpSi0NCj4gPiA+IHRPWVFZV1BNUERMcEF4bHlad0l4ZmhubkNrVEpnWm5B
MVozaE01YTRCRS1RLQ0KPiA+ID4gYUlxS0NOX2pKRUhjT25JNFByNXkzNTJ3WFBWN0M5bDF6MGpw
SWh1bG8mdHlwbz0xDQo+ID4gPiBkZXBlbmRzLW9uOg0KPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNl
LnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19saW5rcHJvdGVjdC5jdWQNCj4gPiA+
IGFzDQo+ID4gPiB2Yy5jb21fdXJsLTNGYS0zRGh0dHBzLTI1M2EtMjUyZi0yNTJmbG9yZS5rZXJu
ZWwub3JnLTI1MmZ2aXJ0aW8tMkQmZA0KPiA+ID4gPUQNCj4gPiA+DQo+ID4gd0lGQWcmYz1uS2pX
ZWMyYjZSMG1PeVBhejd4dGZRJnI9Rmo0T29ENWhjS0ZwQU5oVFdkd1F6alQxSnBmNw0KPiA+IHZl
QzUyNjNUNA0KPiA+ID4NCj4gPiA3SlZwbmMmbT1xZVEzOGNrZzlDVjlYWWpxNmxUTzRlQ1NqMlVP
STJuOXlZcHFaMWV3WkFLcFkxVHlNUFYNCj4gPiBhSkdMdDVvbTdFDQo+ID4gPiAxU2Emcz04bkdk
LUFXdHJJa0dBRlZ3VG1JMXJoX0RJOGREYV9oYm8xeXF2My1ydEFZJmU9DQo+ID4gPiBjb21tZW50
JTJmMjAyNTA0MDExOTU2NTUuNDg2MjMwLTEtDQo+ID4gPg0KPiA+IGtzaGFua2FyJTQwbWFydmVs
bC5jb20lMmYmYz1FLDEsdGdwN3dIZXlIcUhsam8wNERIVG5Ta2hNS0pySDFsdm8NCj4gPiB2LQ0K
PiA+ID4gVUtQb2RfbGpkME5ySVVPczVVLVRWUFlNYXh5cGFrWW9tdDk1LQ0KPiA+ID4gVnBjZ3Ny
SWszNmpqbm9qYlBlSWtDa1V6Mkh4NDBmS0JRSF9uZlFTTHkmdHlwbz0xDQo+ID4gPg0KPiA+ID4g
djI6DQo+ID4gPiAtIEFkZHJlc3NlZCB0aGUgcmV2aWV3IGNvbW1lbnRzIGZyb20gUGFyYXYgUGFu
ZGl0Lg0KPiA+ID4gdjM6DQo+ID4gPiAtIEludHJvZHVjZWQgVklSVElPX05FVF9IRFJfRl9TRUNV
UklUWV9TQV9TT0ZUX0VYUElSWV9XQVJOIGZsYWcgaW4NCj4gPiB0aGUNCj4gPiA+IHZpcnRpb19u
ZXRfaGRyOmZsYWdzLg0KPiA+ID4gLSBBZGRyZXNzZWQgdGhlIHJldmlldyBjb21tZW50cyBmcm9t
IFBhcmF2IFBhbmRpdC4NCj4gPiA+IHY0Og0KPiA+ID4gLSBSZWJhc2VkIHRoaXMgc2VyaWVzIG9u
IFZJUlRJT19ORVRfRl9PVVRfTkVUX0hFQURFUiBwYXRjaC4NCj4gPiA+DQo+ID4gPiBTcnVqYW5h
IENoYWxsYSAoNCk6DQo+ID4gPiAgIHZpcnRpby1uZXQ6IEFkZCBJUHNlYyBvcGVyYXRpb24sIGNh
cGFiaWxpdGllcyBhbmQgcmVzb3VyY2Ugb2JqZWN0cw0KPiA+ID4gICB2aXJ0aW8tbmV0OiBBZGQg
bmV3IGZsb3cgZmlsdGVyIHNlbGVjdG9yIGFuZCBhY3Rpb24gZm9yIElQc2VjDQo+ID4gPiAgIHZp
cnRpby1uZXQ6IGV4dGVuZCB2aXJ0aW9fbmV0X2hkciBmb3IgSVBzZWMgc3VwcG9ydA0KPiA+ID4g
ICB2aXJ0aW8tbmV0OiBBZGQgSVBzZWMgb3BlcmF0aW9uIGRldmljZSBhbmQgZHJpdmVyIHJlcXVp
cmVtZW50cw0KPiA+ID4NCj4gPiA+ICBkZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleCAg
ICAgICAgfCAyMDYgKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gPiAgZGV2aWNlLXR5cGVz
L25ldC9kZXZpY2UtY29uZm9ybWFuY2UudGV4IHwgICAxICsNCj4gPiA+ICBkZXZpY2UtdHlwZXMv
bmV0L2RyaXZlci1jb25mb3JtYW5jZS50ZXggfCAgIDEgKw0KPiA+ID4gIDMgZmlsZXMgY2hhbmdl
ZCwgMjAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gLS0NCj4g
PiA+IDIuMjUuMQ0KPiA+ID4NCj4gPg0KPiA+IERpc2NsYWltZXI6IFRoaXMgZW1haWwgYW5kIGFu
eSBmaWxlcyB0cmFuc21pdHRlZCB3aXRoIGl0IG1heSBjb250YWluDQo+ID4gY29uZmlkZW50aWFs
IGluZm9ybWF0aW9uIGludGVuZGVkIGZvciB0aGUgYWRkcmVzc2VlKHMpIG9ubHkuIFRoZQ0KPiA+
IGluZm9ybWF0aW9uIGlzIG5vdCB0byBiZSBzdXJyZW5kZXJlZCBvciBjb3BpZWQgdG8gdW5hdXRo
b3JpemVkDQo+ID4gcGVyc29ucy4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBjb21tdW5pY2F0
aW9uIGluIGVycm9yLCBwbGVhc2UNCj4gPiBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBh
bmQgZGVsZXRlIHRoaXMgZS1tYWlsIGZyb20geW91ciBzeXN0ZW0uDQpEaXNjbGFpbWVyOiBUaGlz
IGVtYWlsIGFuZCBhbnkgZmlsZXMgdHJhbnNtaXR0ZWQgd2l0aCBpdCBtYXkgY29udGFpbiBjb25m
aWRlbnRpYWwgaW5mb3JtYXRpb24gaW50ZW5kZWQgZm9yIHRoZSBhZGRyZXNzZWUocykgb25seS4g
VGhlIGluZm9ybWF0aW9uIGlzIG5vdCB0byBiZSBzdXJyZW5kZXJlZCBvciBjb3BpZWQgdG8gdW5h
dXRob3JpemVkIHBlcnNvbnMuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgY29tbXVuaWNhdGlv
biBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkZWxl
dGUgdGhpcyBlLW1haWwgZnJvbSB5b3VyIHN5c3RlbS4NCg==
