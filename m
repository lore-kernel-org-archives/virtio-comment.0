Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E41C1448D5
	for <virtio-comment@lists.linux.dev>; Mon,  7 Apr 2025 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015016; cv=fail; b=fnjH0SwCnCuKFIXxo8R+x6IMDvrP9Uy/AKEEEGTVgwXkp9nwjY+diTBqFVxNEuM0lMRqeyB2J7H5kbH1Oca3/bLt1WtQfYO7wV7zWTsH5sXNrDxCLWwJTIKZqjwXBa8eeQjFbNxcXPGS06WgCdExwSz63tDOfrS0P3EnNIUhLKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015016; c=relaxed/simple;
	bh=G+3jNHAuf6ksHCgYIHssV2EzLiXr9M0qkqoDWXlwTuM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ch81uoqI4iHjLwn6YCBY5NmjHBdU6N5QnrEompjXxl+Krg5dtpkJ9oP/0LOb0aEe/ImGa5JkSqmGw+GTx+F6ngiyXt9np9XkkhGdew8NYPlBzTvNHrtSHzHvFiDdKJ4ylj45IluDJTjhtfn1fK75YXYVQqagZVTIpf0E/gF1KIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AlBBsJQU; arc=fail smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AlBBsJQU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53766A4Y029161
	for <virtio-comment@lists.linux.dev>; Mon, 7 Apr 2025 08:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6Sn+SnDpCmMBz7/SydDWnQh/jsUAfiChcNrY/O/J7I=; b=AlBBsJQUMbVT9SCQ
	z96dtZgYbxWO6F5Rir+FF4ejpx1K4+8HJ0W42DwMplJDqJPvT0PTs0Dn/NRI8bEq
	bjZrqIipi7nsMh9Kzvd1P8qvvvy759TB/JXhV739LdyuPSoJIESLRBd3+TW0CqZD
	ZsOAZ8pKanTlkTd1cJ6Rjrma0y1R0u+SsBm4mRYm6uUccRBRp4gPOldKR0jNwmdk
	zJP0hPWNOc0+vOUz2NBZNRmQoDnCve+mdtazGJiXlf5E7cgrUfEEq9X2qNC2yNU/
	4cHEcpV4rw75NXRWcLKrRy1Sc2LRNBlDj3lUoi4ZqHiuKJ31uf+pSFx+7DiWqZlI
	iBd4ig==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010002.outbound.protection.outlook.com [40.93.20.2])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbubk7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Mon, 07 Apr 2025 08:36:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDoSFkAOK0yFjuSZQebT6MrPqZ3SQJnXOGnB6ZI2zIDmIv2/4y6Ud0VaLUvby9bQeP3SqqwuZC+3kUp1U+WC1HP/Wr9imCpMY7W4yIDYEOx0KaZ8R5cXvN2K1BbJm9hab6efuJyZXuxFzj/W8oq16ZShbqUNc/4zMGseJCIDKVBjhdMvr2sf3JRWRdgKz2PWz0XD+HvxgdhwvNrJghXK9MljC/ZFET0ZrTJhueH3+aCZhuaTa21nROEYJzfPurBDqNZdknzAeamgeUtYA4y9o5GaWDifu9Sx4MbbT9iDm4c1G3pHBdmWMNyBIGGm/8RMrtD0t3O7wiubx1kYDSWPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6Sn+SnDpCmMBz7/SydDWnQh/jsUAfiChcNrY/O/J7I=;
 b=OKTdd5I99tYE2TtN6/MwVR2++g7LT02DdPnuLJvfFnvZOaz1406DmPW1NRxibZ/RxhA7PedBmhdkfGeZQr4hU2yDqb7j9ff1D2WXlGpvgnndav5H5iifW+BRv1d+I053kEkgh8u+bYzaDHuCm6N6b2eQ/PCA3Qth+vgAF97X+1z9dQnCQqWMjZgKIG8BQq4RP+uOqZ/ekEXrxs59YzYM83ZPnlkf7AUUREV2tdWa+SR/rgpKGT4hAOSQ3k2dlSlCwWpoIyG1/Fsdq6WYhrlBE7JwNQF4rfGLe3ZfZSc7c1kOjDeOrHpHJKf97nd1OtFuKTbGH5FWMUIPLmm4pdeHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MN2PR02MB7007.namprd02.prod.outlook.com (2603:10b6:208:207::16)
 by IA3PR02MB10389.namprd02.prod.outlook.com (2603:10b6:208:53a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Mon, 7 Apr
 2025 08:36:24 +0000
Received: from MN2PR02MB7007.namprd02.prod.outlook.com
 ([fe80::eab0:b587:3138:f48b]) by MN2PR02MB7007.namprd02.prod.outlook.com
 ([fe80::eab0:b587:3138:f48b%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 08:36:24 +0000
From: "Aiswarya Cyriac (QUIC)" <quic_acyriac@quicinc.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "Trilok Soni (QUIC)" <quic_tsoni@quicinc.com>,
        "Aiswarya Cyriac (QUIC)"
	<quic_acyriac@quicinc.com>
Subject: RE: [PATCH] Reserve device ID 49 for Virtio USB controller device
Thread-Topic: [PATCH] Reserve device ID 49 for Virtio USB controller device
Thread-Index: AQHbQk/F1C2VjFa1m0yOMHAzAP1UP7LUrp2AgMP8ztA=
Date: Mon, 7 Apr 2025 08:36:24 +0000
Message-ID:
 <MN2PR02MB7007629706A9B0EDD900ECDF90AA2@MN2PR02MB7007.namprd02.prod.outlook.com>
References: <20241129111325.952-1-quic_acyriac@quicinc.com>
 <Z08mUxvw4pWwa+eb@fedora>
In-Reply-To: <Z08mUxvw4pWwa+eb@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR02MB7007:EE_|IA3PR02MB10389:EE_
x-ms-office365-filtering-correlation-id: 9807c9f0-bea2-4f3c-2955-08dd75af4823
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?a6+gawJIrjPPZFoyFC3VBibUtEFiMhmFY0d/3tZXJZCMkiN1a1+FXgxnwIpR?=
 =?us-ascii?Q?NkkWeCk26gfYmE/NZ6ESfTsxywYBoq6LbLHoEjurKJ2Uv+wICMbIjQb3j1hj?=
 =?us-ascii?Q?rZcn3fbG1DJfwR6ejMhuuRC+dbzbG2RhU6+FZoIlLzx8IozCf3tCt8gIT8h0?=
 =?us-ascii?Q?pVA6CXoq+2COuxyZMDiQiAaCmu5kJnnHZwaeY4B8KEOVw1TsB2VbZnJlSHdA?=
 =?us-ascii?Q?CA6Nypbyx5n69qSdp9CyKrs5ktGnrDYXchFgQS38g+OafF/81/QqnMAK3tky?=
 =?us-ascii?Q?yUMCNQatGxqQ+qw9qvMlBR48V8g7NTNkbhyWlLbOYwxy/v+CrSk+8I0tFazZ?=
 =?us-ascii?Q?1oH+roqlegsizcOrip/5xHmA2aqEVTcRyt2G1jL+NWxcMIDaw06sjbPCsl8X?=
 =?us-ascii?Q?rbYpqgMWXxnWTQKrQZxkiFzal3cmufgIu9U5xZyf4mvUPT+rPn679Xdq15ih?=
 =?us-ascii?Q?0pP5HUTRFYt1nrmamlagTMKmMWCvqJ+Cy1EevWa6A9Eo3g1yzpsJrV4WFIJY?=
 =?us-ascii?Q?gSBp3Z/da0NHve6IzFvBiMyDTy14tPfv8/fbZVPjF998WSuQeg9hXcVKlxDu?=
 =?us-ascii?Q?9EKA4+vSuq8t57yKb6QeGMRd6/TKUuqiVb7aCf2XzpVFQkAezG13c/MQdKbv?=
 =?us-ascii?Q?dkKLwo0Ny8Fi/n6AWOz5YozLmolZq+fZ4LMNUlZDvPD/N46bDBI7IX5e8Yua?=
 =?us-ascii?Q?nY26Pcm7wCCaXGeA61aRj6cF0IW66G3tmxSOJb9gZxQwGHvxXTLUHg5QQJwt?=
 =?us-ascii?Q?TFlu52p9Hgfj7Ma1tay6lwSppdy7p43A8bZNQPRz7yh5DcZlFaby6fKPI/fU?=
 =?us-ascii?Q?KXxGRnVJW/P88994L0aJjp62F87RDLP9MkFHZ/ISguuhUC6H1JwST+6XOdTN?=
 =?us-ascii?Q?MIijAQ71J1qC04sEBksmJMdt0pC/+pJrac/f8hXaJ0jFnnQzJB3n8e4MrUQd?=
 =?us-ascii?Q?LU2gxGntNZD3oR9tk32OUNatRMh/Tf8A+/nZJqDdSOZZ+r1TCQ2eDxFcA08c?=
 =?us-ascii?Q?Jkh9gRBQSeGdRflRrjjEoBjUftwW92NxUjfmvrpOnwjIybwKjGY1JFEYbkko?=
 =?us-ascii?Q?1MzxGHSwTFed5itoFuzfx3+waZRIY6ZEbdGcDoFehJhrAH9J18U1MJC3rPGC?=
 =?us-ascii?Q?5UdWvyy1AEmJkLRoScWa+k3azdlpyg27NwUsjeUJomybzI7oKt9CTnx6EBsJ?=
 =?us-ascii?Q?5y21cn+dBiUmMrGLy45sMeEKuOJG2HABvFqrLb/ZCCMWZcBVHQtr+jXrnaOb?=
 =?us-ascii?Q?7Ar0531wPwvfRQ8wunvszFH/iW4GGlZ0xDS+HALksZ+XpMl+yoWuGG0Wqftd?=
 =?us-ascii?Q?kGP9yMZNJ2pBZHimrx/xghQCpwrTnfBpIETBMOVq8Zy+F+BqIC0XMBYMjJpT?=
 =?us-ascii?Q?qMYBASA197/sziKzTzZWfOSY8ZgR5HlAo/RFcPTcqWwKPs/znCL5vKdGaoDd?=
 =?us-ascii?Q?qjhwcHypO44glnIspOksu0ACg+lJ4LSc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR02MB7007.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VxcFnKv+hjNYTFiVN4qa65I8EmXazRsaPGWHAWXc14o44IXuDn+uc0WRSFE6?=
 =?us-ascii?Q?pZexvD8idRNzVIXo3qKHLBM1gf+kGyJFJ/19f4Pxo3wZdsy6pDm1Kij7FMWm?=
 =?us-ascii?Q?vfqfSro6kSUoBgmYhIholaUwZPMepDvj6rjyOTJzk/87062TIgIcGI+vhM7f?=
 =?us-ascii?Q?a5cQCiZC/r7E7F74GjVVWdsiXyWTHQtFrjKFIT8qeDrZ8iyPOn5aBSSn4QrX?=
 =?us-ascii?Q?d0SBwEjSQI/caMPpezMl3oCMf2SlGpSM3rP7L1CHwhE/NJbxOliFYZa4mT2F?=
 =?us-ascii?Q?Ts3gcFSAN2JpfJS80inpXzPwOp3lJIzllOEi8I/phJoZ83N3Un6HNkuMt/bW?=
 =?us-ascii?Q?DyBfsP4yQchjv2kL7AQm4SWI/uH2ajqlvoIWHHxmVmEprOhioRwxrU1hB6UG?=
 =?us-ascii?Q?JrAw28rOp3BNKlRLX5k1WZHq+b9GZBSvj/v8Sj04dU3p5sY8zhIGDqvVQpey?=
 =?us-ascii?Q?AIlfCkJXucRTYUhReQ8GUAExKh0K2Y+xpDmGCFyCdploEqUnY5IxoUWGGQsC?=
 =?us-ascii?Q?ZgeWyMHOmXFKL9I4CcX+6FQOTphhhHDN+WH8ZtLWn66DxxTgB5YfJJDG/j4X?=
 =?us-ascii?Q?i11ek4KK6fJAFwYgpsOcaQFYTsae7kgRoXxq2asq2ahaGzF+mewqTfx+Sj/b?=
 =?us-ascii?Q?qY0aUHWq9cZes0hTSkhjGvpjU3gaPZB73US/ZAxCl4uzlxrUKWXZNG6BbrOn?=
 =?us-ascii?Q?UdA8aRx3gtN8N8f69FRIjX0DWDBBaLYluAeyv2/dKlbvSnDwgsXwMhD1Hf8s?=
 =?us-ascii?Q?U2BBBfH6ufIqkhZbYlROUJs7aRZfAW5J7WugA7FuLvaLEMYsNfni95Q1HQh8?=
 =?us-ascii?Q?wxB7/s5/R+FwnDELUAkq+qjPmluxi2YmVzj532HpZFJ4RD0UYdhvssS2fYQM?=
 =?us-ascii?Q?God3SorhfccgCn6q3REiMOWr5igNU2ETZG+Tbk+JZ5jw2DvRTkhl4hj2YKEv?=
 =?us-ascii?Q?exX+UY9+tiHlc/c41fxSEOvA4WW2Fwuon0JGm6yZgPHQsBKvraal+G28OHoT?=
 =?us-ascii?Q?UXP5Sz41V312y2bzSeMEwaBUuYov/42sCLp3i73KX0BEKoyBwRt8dnwJN/tg?=
 =?us-ascii?Q?ZV8V49BXFCOWkTnagz8jONDLL+cNxFFNtSr0ksBLNbuqYqgtdBNqcq8dl2hA?=
 =?us-ascii?Q?Xx+NwxARUa9YiK97SO3Vf+JDTc76v4PaXu9cEle/92NO6TnJN4tgoasw7o9Q?=
 =?us-ascii?Q?hf/fx5JgjRfPsIaPwEe8VXPKe/g4edpJBItgMZ4uMKyVtG/wONo8f4+FXz+M?=
 =?us-ascii?Q?B2ao7g6kMB8LYcpe/utcO+KgSMFmBrwOp76S27Q+TLVhq1iOmfbaz5NnkoTt?=
 =?us-ascii?Q?5RUq9V7x/U4IVNNxwjNTjUukROTiNIqk9ioc8FR3kyWtndxB2iCZUwf0Pizs?=
 =?us-ascii?Q?cJq74YiZdBVlne+VDxTbbsiDkqmOnLpwPuCSy1Q65/2qtsG5IIb2YMowBAu+?=
 =?us-ascii?Q?Qk5M5GDJ0UwbFHiYYx1+7mjXbuQvQzl0b7nEFEE48rugDHq+E5J2El77B+Ca?=
 =?us-ascii?Q?TZqjLN9EgBvdPippEije5oNLFQGSxF72J5uEJrJR9aYR+J1QmGD2H565aywX?=
 =?us-ascii?Q?oa7ZoKZVknpi902gVo1IPdXqnplY2RA7Y32gV6r/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	COk6nPJ8u7/iib1KkgDvRclSQ+7SXBKoq8gxuHAXFt2WTKoAIngkmup7ifqDziag71vBKhqzdfQIJJKOhdzid2YhmNVA/Bve7d92rj0PuyxH2lrAg/kw3qCyoCW2XtBl9WhA/ve2/6IGBUTmV45zrsVOTmRQkDpW9WunjBwVfFWTi0J5kOvgsR+7sPGlKZ6DnZ0Oq29JWGdR7nISOHgXwcY1QNcdNHcxnmbg277Z8k6FOzkpd4cMFPQsNm0CkvDv6orDaoxoxMs1rdQ9/Xzdnc/ijHRTMtj5mNdfF6QjqIsh0zdJ1dU2EEgGHDQdaFZJJwgnuWr6rdVpiUKL9e/JpawprWUcYgTf7KXqir0v6OupfbCfXVG1l59ECdJMaJ2+EhmQ4ttPGnthG6wf4YwDOkL76XDloxwHv8m6dPtAoeTPY/oocezzof7z086XcjTLNIYKBkdfLjRU5t7lFKKeq/F2bqxPthZSGB3OW67CDrWFTGCxuGtdyITexuPgS7Y8/1/+GjTCQ6xqOe962sZaHA1iR/EltPhW5CxsLiJUgUa97+e82I7ZzKVTeez/Yqq/qryqCg9DOatzN6HEvXOl5w8f7AtfY1WhRWGr03prc6UVWyMpUjBwTm9AZjxKqMVH
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB7007.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9807c9f0-bea2-4f3c-2955-08dd75af4823
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 08:36:24.5863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gouOhObERi51FdcNovT3alN01/axUxdcSN3ck1CuQSA0Zp8edEEWFHr1jxzq/hhdNSDf0oDkIRuvyVm69YlRIZfh/O5BCNpS60hOyUmSWXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR02MB10389
X-Proofpoint-GUID: ex2mwMLqA-hyk7pwuDhtZi7bJRF9zGuS
X-Proofpoint-ORIG-GUID: ex2mwMLqA-hyk7pwuDhtZi7bJRF9zGuS
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f38ea1 cx=c_pps a=qtOW3xRV1T1JVXeTS8V0gg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=COk6AnOGAAAA:8 a=bSQ4Dtshtds6VK1FmVkA:9 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=899 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1011 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070061

> From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Sent: Tuesday, December 3, 2024 4:40 PM
>
> On Fri, Nov 29, 2024 at 12:13:25PM +0100, Aiswarya Cyriac wrote:
> > Virtio USB controller device is a dual role device, which can=20
> > function as a USB host controller or a USB device controller or=20
> > support both roles. Additionally, device provides support for=20
> > switching of roles between USB host and device.
> >
> > Signed-off-by: Aiswarya Cyriac <quic_acyriac@quicinc.com>
> > ---
> >  content.tex | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/content.tex b/content.tex index c17ffa6..3c687ed 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}=20
> > \hline
> >  45         &   SPI master \\
> >  \hline
> > +49         &   USB controller \\
> > +\hline
> >  \end{tabular}
> >
> >  Some of the devices above are unspecified by this document,
>=20
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>=20
> Matias

Could please open a voting ballot for these changes?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/211

Thanks,
Aiswarya
