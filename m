Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C17482ED
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718127804; cv=fail; b=g5YBzUNAEiANT+13Iyiw/ZPu+97BPihR+c2rQ/Mb76jjC7J++OEex5JrIKExrtNygCMz8hObNCHuGEFjD0NgF+jXISTylcZUhd2yI+4d/j0Q4nx9HTopz8ozutn9rSa4GIW0Yls4NIWX8f9vRitX8F0WEtkG7B7E8LD5dHegL3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718127804; c=relaxed/simple;
	bh=FeniNPgjVDk8MxMStP4AU9gJADMb7Ezh0KV/WhDmmkE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tuNvVsZ7ah6F4vHCRSO92hYLrLGXJIvFqPfM1amvPWqzFlMKFKXv6dxd3gy4sOwvW0xXrOltfWzrYM5n8BX/cyb3yORM051zYn3NfJS7VcJRQ5hFErTmZpAMHP5OYooafzSJya7vziFG/Vwx+zyVdz+3a/Chsa++Y3oGlXKERLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dX1n7ci9; arc=fail smtp.client-ip=40.107.93.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dX1n7ci9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQjaAAgtswq7Bygh7+ZY/4B6j8VNkTApCyB4gwjrOosj61o4pzDmLngXDPFy1KgRNwRxo1f1WN1R8lkAqsFKBRNozJyDlezVL/kkMn0FBkaOGoO6b/J4M5UdwVB9li6WiRLhVok3YL4Nm/mIPmekkt3oNLqdtIggC7WA1r4OdpMuhBKLGM2KZ/moBldodKcnGx34qiQSKy+KezxECJlfa9YPOr8TJUSzS8qKflFaqiwKvCPm3JX/MXe7O9C/oJw0909N9jfJTF0H4KHB/aTuPjyqNRA98bpEZs82MLmEOSQv4xoBHgSMb+YOlAp4C/OKjlqj6Y8Qr3kmt42kGA0x/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeniNPgjVDk8MxMStP4AU9gJADMb7Ezh0KV/WhDmmkE=;
 b=RKJ/D46nlT6pyIpj5XDeavgBBssOT7rzfmqiUQCuuMJJCNyBRFQKSlubKMF3vTMsDzOfLW39twPr3HvuBkxxnsOjtf08lytB9jZdG+VwiEYUlTNz8IzREZ6pt75oVXC72PtSxkwmToBaJfv4wd4W3MxTutIYCNWNXuFWawUvXAuxdLU2RM48lIa0zN/k1dFIJa6y4oXckkpIKEQOCPnSVYESlOJeObqZNDvbtP9fcMtYJaVFDs2IE/IVfSQ0+uvpjwdTgrRj+788t2g/3dhqHDtMgQpUUmvXXDATOAgFplWFpy3VzBXonAJ9wsYB+ULEi7BUqjGasreMxvCI8srUtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeniNPgjVDk8MxMStP4AU9gJADMb7Ezh0KV/WhDmmkE=;
 b=dX1n7ci9Pm3b3zSUbSzOJfHvSgzLl/gNe9R31+QnAT7kpl1VgcFQOFR2gcCbfLhri8OTRVM/K1UbZOjUjitdWPhjttqf4tfHTqyRYuud4Yn1B/BwHhpnuHB1dcxvbFBsh/vKfEhwWG80LgJ01Jy/XlieaUHotveJ5zxIe5eQDdCg6dVMertq4Vy8kjnwAgegYeRqGk8a0W83Q5h0RBKf022+JvSSh3G29PIit/prpLLLK4F81imybDxs1faeigRRpMAByojFsmgNjnqCtQAvmMK/tKIetBlezUVBW25DPhcrelXAUodkxz/qyY4CQt0UpTDNvoiaMC2EOK1wFUWbUQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by IA1PR12MB6530.namprd12.prod.outlook.com (2603:10b6:208:3a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 17:43:18 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 17:43:18 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>
CC: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Jason Wang
	<jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: RE: [PATCH v5] virtio-net: clarify coalescing parameters settings
Thread-Topic: [PATCH v5] virtio-net: clarify coalescing parameters settings
Thread-Index:
 AQHasLoaN9ph3vhoUUGX8SYFd1DUAbG8yd8AgABtagCAA8+PAIAADeSAgABwqwCAAPC3gIAAYYKAgAAUBtA=
Date: Tue, 11 Jun 2024 17:43:18 +0000
Message-ID:
 <PH0PR12MB54813E2EE4EA2BA729B2F6B7DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
 <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com>
 <1718026545.7557275-2-hengqi@linux.alibaba.com>
 <20240610221900.1810ea96.pasic@linux.ibm.com>
 <1718102433.0456574-3-hengqi@linux.alibaba.com>
 <20240611122756-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240611122756-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB6530:EE_
x-ms-office365-filtering-correlation-id: 349cded8-aac2-4a62-12a4-08dc8a3dfa97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?AHML2DJCz+NBbuO8cfZ5IkvtFgEozIqBBtfAE/knuobXv9EpcWqqDm03/QFG?=
 =?us-ascii?Q?dhJUGELJwyuVXMh9F6kGIAvomCwslwY20T+HOxA9AmfmrqMbIaMMrj3rUU4w?=
 =?us-ascii?Q?RTTr+eFwyPU1XzBX1eoZV2lyZio6hRBuh4wp5yCWIBIbJ9VgllwEfPcmrqlC?=
 =?us-ascii?Q?IixwG0hni/qBx4OjmWlN/cD+B8+N65905yA+JmxV70VBuERUn+gKq59Jf3IP?=
 =?us-ascii?Q?Rppl1Uxku9hsSwipALJcYPz3Mbfi4Fe6hgTMlptj6QGbcTN11m1KXIjDxzTh?=
 =?us-ascii?Q?bTlX+Um55w93UJJ+ITm1E4Rl3bT5OGwVhoon95gfLeyoyWswCH4JLyYVeqoN?=
 =?us-ascii?Q?OwkDqnPnBDiVCTjgxHoWHpOW5kDZ2nLW8NEj9CqokHdGcllQiEEnALDYven2?=
 =?us-ascii?Q?AyYcBr8+wY9YIN12sKxBZNBopsjU6wYaEYtWDp1x6E7pdVDVqSkDvz5P5JoX?=
 =?us-ascii?Q?U8ecpO8cbuwJrFhmIHao211+xu9xUl6PYQIWyNBwgEnjLMByT0CXN+l+Wt7R?=
 =?us-ascii?Q?kWOOCdhSg33NwrefiiHW+ZGF78EL274vqvbH3pg2/hbKCZjFE4wZ4K2QwgQK?=
 =?us-ascii?Q?ivaHCPpkKBH3oKiRwB/9DdMDOyl/Uw7S6Nzs8sAw41kmzr7BuMmylqWOKk1X?=
 =?us-ascii?Q?jW9ERNPFCuPleGNZgy/GsucOHJ+xgVO+XNm7HvujKf3+MXlfkoDiPcoiAdHv?=
 =?us-ascii?Q?H1LmwAjzFfoax41wG33DMSR9i4kFwAxRvx7n3AN9h9ILJMopyWxTfUPrjMnq?=
 =?us-ascii?Q?lBUPaVoyu0mhDbIpcrY/Jyp4dYCk2ErHfyXtmaB19fnRi8LeNlUs0xQEZran?=
 =?us-ascii?Q?r6dmAOUYGwLc3C43XNn5lzCX/pn1SGIeWKsoPxeOZhV/4RvFwsppjEUGR1HG?=
 =?us-ascii?Q?dZdyZ1hJJw+IuSc1qhnS62OxsH5EFE1vPmYVWDpgMmvbQkcbTiRN3m1+Moe1?=
 =?us-ascii?Q?HDiq2WChsUNulrDKVOPhtkLLpPuYa7KNSlrfTU3ZZRUZeJGz7d1X5vUhsUIF?=
 =?us-ascii?Q?0hOEAe2bzFvpUEHQLbiecMTB9AUCm0u7y3CHMD3D5ycimr0L7VmuGF/sZu40?=
 =?us-ascii?Q?xw8rbcumRt3/mh3UvC2T9yWHUNnLvPQ+7jv6wKXqIVe7SDYn0qOG2N+U2+Pv?=
 =?us-ascii?Q?tLFntUsvj19aYHggpn3pZGJZSqZdfmpM5snq/mjv5S5FnnHbrQElU0srQ5wb?=
 =?us-ascii?Q?0+au4eZrsZaOntSbHZ5tPajMLSfd5vY2TwoY6UvL6ZEZWQjrSk40l7cjYhTV?=
 =?us-ascii?Q?qJKSIT6yf6YX3H25LPKe4G7vGwCWRTZ1S/c9fDyMk6UqBHJbkQfQEZDaVicJ?=
 =?us-ascii?Q?tqvKs6XEEsHw0sSFnllaSwbTtubnk+OEul8VrOAaHdopfaVMfIHUQWNn1MUp?=
 =?us-ascii?Q?bp/34x4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tXYbO9dNUW4TFD2e+Wsv5CofLas3cb+/FUVjYoUlwOScL/dN5QNgJcruKhpi?=
 =?us-ascii?Q?MJLFe9sMFXCuP8XjPDWArCYDLBZ997cpFf+WvXiNzI52jz2e1wWtzDxDDPZx?=
 =?us-ascii?Q?Iz2O6P2T0KU8R2DTDC3sWfjMO+KdKifZhgZ9Pp24h0BmdtN2LmcV1+SNxtom?=
 =?us-ascii?Q?ceHymSoi5L/R7XWNQrBSI7/gRS6rqOZuFaVSS5+vFk8KXdYQEsEoXqxvp3YE?=
 =?us-ascii?Q?Uy8mb8dpuOaGVuMnjxnOIidC5ElOJCQ4CNj/JvqRSIZjTuz7oogqkzg9JYRN?=
 =?us-ascii?Q?4TMV0F9UWXEMRQjn2uIYWsTWXsEOSEKdsjxgcBtDuIK/bGDIAsapKgjTi6pH?=
 =?us-ascii?Q?jinDobauIowXXrOp/NBXi2xdR59D8v1rgWdgBwUEaIeX54v1lI2M/As8lqyR?=
 =?us-ascii?Q?F9okei40k8EbpqePxMsFTGFaJMwKBaQTM4/qIycD1eQxmZ1CkWy/tBD7sbv8?=
 =?us-ascii?Q?e+Va3GUMyt8wZoW1/vDcl74TbrjakVB89g4Pw5nyGor6LXI5ZVrMwwSztwGj?=
 =?us-ascii?Q?oj8/JYreGSI2MkTgRFg6Fyk4epZlJMq9yEgBpS98s96zFJWhdtnGzlDMdNHJ?=
 =?us-ascii?Q?orwC4HK90rxBnvYKmphSREFcAblM9eGxNqrx/tRKyd0L+ixOmObqIkxFnG3Z?=
 =?us-ascii?Q?pP7mstzxZKJTNc05Gb/f/zIidgqdpSVD5qzHsBqn1lqfnwX70DG8y8NwFNwP?=
 =?us-ascii?Q?Nm+cGbNlGCdr3m18eJOVxLEZ4i3cFDIZwF9TluvFdJWFWM99khZBIgQTYgzp?=
 =?us-ascii?Q?KVDqMEq+0BH+PEa0SYZXuAz5vJtOnl9hqiWWkYSAe4UPTikha/bi0shs10FW?=
 =?us-ascii?Q?/rH7JNaIqjEU817C/Y+hrqRgvbluQG6IeIVgUclUDFiS/0g4CDBk2mFXAGls?=
 =?us-ascii?Q?Yrk8H6JG89s++CXp5GVO4X4n0lS8+D4QJkGswgKnuYLdy5TudazEV2llc8Mi?=
 =?us-ascii?Q?CMXWBkLoBXZVrZzNz9H+xaYKYmnbziE95oW9vDgAzWcbrHvNMke6q9+EpX1+?=
 =?us-ascii?Q?MwmWgi5Yd4eQyVyVZvTJ5t2nTDr27h+XHa8yaFLnY2GWKHND8Md/1L+6fDGg?=
 =?us-ascii?Q?CzhATOiLPCDq9U3onkYZPvoPc75HU5DWzcZkr/DQ/9tRv21ItGmvSP/hNV8U?=
 =?us-ascii?Q?+HLEHAjtgalXH/YZZBIrWEol/RnCWXpvPQ2E5V3j3KODamSLMDPNBQoRoVvZ?=
 =?us-ascii?Q?Zg9UjhHRsDByp5/TJe08uJJ2qqnreJNlRP+21gdWOdVhZMgDIN9Bal3Kvmb4?=
 =?us-ascii?Q?abKKsRqB0y/ReDsW6x6xGrCcTsr78fswbYc5OaNA/rd5sCaP9WX6G5nzS/D6?=
 =?us-ascii?Q?CXNqgYAs+nPWc8XI6YeRkPPNr+TEmb8FAyvB02F+dt49Sb590Q4ZbnbrFVt0?=
 =?us-ascii?Q?dd2AcWMvnXGZ7J7NDG9RWdTx0jZEbMfTCvCrQsDkF4YIQ6hRTzL6dqDcsgjw?=
 =?us-ascii?Q?kE/S7rjD9WnQkLFhI7xArvudRzDRTuiw4gJj47kOck9DGp7Kh52uE6/qmTvD?=
 =?us-ascii?Q?W+BIABRI/KdVumN8vutZyaavXeL4Mz7pUUKZEM5Aj2SpyTa267/X1oI1MlGo?=
 =?us-ascii?Q?ZS4l1SBSzCXExZCaTbg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 349cded8-aac2-4a62-12a4-08dc8a3dfa97
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 17:43:18.1092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4C2MlEdzUjsmdINWLg0RGWhQ7h109bR0K64WI+6rFzW05KOb1Wgq9OgF/DegDlSPliDpVgGj0WMMZgets+lzXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6530



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 11, 2024 10:00 PM


> How we can we make progress with
> the realease but sure we don't make backwards compat a pain?
>=20
> Ideas?
>
There is no functional break with this relaxation.
Device set some non-zero defaults and driver didn't modify them....=20
Anything broken? Unlikely.
And device/driver has better performance, is that a problem? Unlikely.


