Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2088635F8B7
	for <virtio-comment@lists.linux.dev>; Fri, 13 Feb 2026 13:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770990737; cv=fail; b=p7LVd1t91OLLbkdR9lbmiZga1vy2lH0tjwKX6/3ah8Oimx/Uf3k11pnRslQuoNp3IcI8NY3qeTys+rif3Bj6jlYqmAY7lVaF2bs1XnXvYxb5AbswV4++UrMF3DOsHmIvDMTZS9foXOLdpm00MwvZQOxyYNSZxINTxAGrKaRm20Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770990737; c=relaxed/simple;
	bh=mEGcBYz4i2ReM6ONdO2/0ggV2u7XNKlbg5/JMzX/19Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OrEAqcJc9QvBF/wF4YbRwS80JNovJN1mFuqjA7s0hXu7ETTb0Ag2k9vEbb4+14pIDZUR8uj+5+t3qrfiqjQrZfdgNWIhKrjqqubsXatnwVFV/EOiPo9nbAlqleH2EFGPLWvgrk09cUeSckkUk1QQyCyc+tffY3ptEzDfCvXyVVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oFXUJCn9; arc=fail smtp.client-ip=52.101.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oFXUJCn9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anr/ZR5291esxOxnKxher8vlChKzjOiLDSuzWwGzYApJA1ixNvUqH8nfdoX9KixvPrCjuj/inamPeddLDioE8I7T/tP/QwrNZ/pssaL0q6B9dJrbg0pS3gLrvwMRzN1pM5cde/mfa/GCbolD/RvkLQNb/SJMDMDJjSFdVPeFJlENCdLQbh4BKuCpJFl0PQXRmdcZHftXWOuZGoy5BIiVFPmJ/zcV5/NPeFVGBNtAE9Pj9Ohmy6CCaAcGiZvG3no9kn6jhwCOC27oO97M8Fh1iw9o+coej6JuFW+lG3rIGV9IvLH180pl3m4rIIjyG6EhQc9745mvi82KQN1v3Y5l5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkVpU7b7YPWU6UXW3FwbphFeOFeUVYJgv7pPtZDUMLI=;
 b=MJefhiHrWw49lIfNwEBteIvlH98cadxmQgrqbekI340YA6N7Y2en7CeqQzCGEAF8/hpnUC0p40bCLSsmWSMDpb549tH90DpjnjP1TBkYC9qOL3NpgxYQuXLZaPW29u97GBsjNL2M3curmq3fmd54nkNk8Ug9+s20Hwy1TI3NPV/f6lTYaY+8RUQ01sCUPl12an0EzVzJBOrwaNFO71SIr+b/3shjZ18mt3rYC2uNkG0y4l3cAig4hvr++dhkMXkXdv89716vgXkfCt5EMe7lutv1mowPKLJERL0Rclp6ArPELeIp1uwkdLzuPTHyxGrvhFqiWJbRLAKpIVnf0VN+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkVpU7b7YPWU6UXW3FwbphFeOFeUVYJgv7pPtZDUMLI=;
 b=oFXUJCn98+EPwpa6VqNFlHBpOkaPrUA5EZKL9TFCCH8ildBpzzsS3yN/9G3FFNNIazNFzqE2/x043xd1aICK1uWZxpSmu3YUtHkLRBZ401EtczkOr0tU3318SZGFd2s9DOAGTOsHXtRHbkC8PD3aDPIPYGMdcOegeFDmwUv/1ZmII3AK4LQnj3z2qPCb9oh9sHeqOQIBDoH5dqAciDsa3bl8TiFEgoPcqzyii0iPaVqDTYoV3fiuwSSZ31wYnsNr9xqJr9aMgeE3MPZmBPqv8B3zICoJtKFEOsgumpJlWPLZuqjfLzKZkgESJdnN6ntU2aqCnUGW/2/1Qk9M/wvL9w==
Received: from CH1PPF84B7B0C96.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::618) by MW4PR12MB6973.namprd12.prod.outlook.com
 (2603:10b6:303:20a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Fri, 13 Feb
 2026 13:52:08 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by CH1PPF84B7B0C96.namprd12.prod.outlook.com (2603:10b6:61f:fc00::618) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Fri, 13 Feb
 2026 13:52:07 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%6]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 13:52:07 +0000
From: Parav Pandit <parav@nvidia.com>
To: Bill Mills <bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: RE: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index: AQHcjuFu3dyU46FhXkWSoPS8nyUxT7WAvzgg
Date: Fri, 13 Feb 2026 13:52:06 +0000
Message-ID:
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
In-Reply-To: <20260126163230.1122685-1-bill.mills@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
 SJ0PR12MB6806:EE_|CH1PPF84B7B0C96:EE_|MW4PR12MB6973:EE_
x-ms-office365-filtering-correlation-id: 5d58244a-1c63-4782-f165-08de6b071381
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7142099003|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DMRjHXxmcnE12FJZd6sjz5r5I3w90zpOxzJS7XKGMlc/XBP9jlC92PlC38el?=
 =?us-ascii?Q?9D746+5n4LVYm9mmehL5PTVARfD9v/CivMnBdT8TQ0Xn2QpwOxGNNc9XwD4+?=
 =?us-ascii?Q?KBQUybIQXAGTOBS4LUDTlUtBvtkxwCOCvkjW2aBN7qHOaanOcIX0l6dRf+zx?=
 =?us-ascii?Q?lQtAVMFiuTw+aJSWX9LNweroElwK8YHV5b5cBrTAT6Dkwvb1cgrRerpxruNR?=
 =?us-ascii?Q?we3G19nG+qYiM7illooVKnHMYRD2BKzvT6sHhrDsEXX9Y5BkQn1AnNmMcJp7?=
 =?us-ascii?Q?60lFuZ8vaCVGB71VseG6n3VB7CpS/K1X1OCVJkJumw4ZVY7Jc4bTs/GVB//j?=
 =?us-ascii?Q?9dD4LcpUHdYTXSrqp5OZpFnA0LD/9oQJT4Nkras/7Hheo41P2r18msokEtrX?=
 =?us-ascii?Q?4ks4BbiIagym79dtzhTDVfh+pJ6HQebwmhiuBRYYc5ZptPIdUNwOW/Z+8S7J?=
 =?us-ascii?Q?G/UIz7LRb5jgcVSQhIJ3WFLQUAu3a3sgvFOFZ7oZrjsSOdT2ireqIvgZqVRf?=
 =?us-ascii?Q?BEj8E0RSgWnhRfO+kBLRmwmbRJi25FQBtgjfQ0VnvbPrNjfB5ObY4aOVrKFp?=
 =?us-ascii?Q?L4t92pTbEefde7+4tHpXZIkZDKMdb6PpyMfBSje9mHZOtZPvHaJOR7SlHObA?=
 =?us-ascii?Q?eODoCqQvSCnBqpKoivAtPmwdOKUsTXnou9MpYO+Xzr24JbWhRBq1F482yKkb?=
 =?us-ascii?Q?nShC4m7svQgBHeNqZZT4HY8Fqh9aPAuEiNtEGnL38Mrk7Ij5wIbM7Qcwroux?=
 =?us-ascii?Q?a+edmDubOuGkIz2GzHgAdfBKLwuRFYQ6dpaww+s8Ry0KXgE9mRimbEYs9xEC?=
 =?us-ascii?Q?tMTqU2ZN+YlFgZ5dAXoF+cex7UqB1lKich5OgGot/D600ZN6ucC/fLU9kTyw?=
 =?us-ascii?Q?y0H5L4irUxldPK1iD/pXGTbgMf/T2pHFrnklP6KUN5s/xS/Qhqv395dlaXXm?=
 =?us-ascii?Q?GgatdQmOta106yi20GUZkOo4EwEDC1hdE8nM/0ndGMKKeL6AWBeGxxt5acvR?=
 =?us-ascii?Q?G745ASMmV3v5uvkLEm2TA7I1FvKcLyi9X32AiTtXU+11PNw/abhHUS7gAbqy?=
 =?us-ascii?Q?WZRIxMK2IeipuYHseTOPm91B6piWCha/urh6AlyFniLzb2BmRjEcNd6quXDW?=
 =?us-ascii?Q?QYvjbt/DJJpfj1bDIOS4YxAxgT2h/yC0kufmcIOh4vbrMMeQdHjoDpd4TuhY?=
 =?us-ascii?Q?uR45uG4E9/mHNwmgAY21oVWVlHAvgNDYCcuizC5dUUMzgouM22nF4cVslLvz?=
 =?us-ascii?Q?oPmBzexf8qx8Nd5YRpwSMBk9XT8Riq5HL2AadcHuKJK7jDxPntpCgVdiJ124?=
 =?us-ascii?Q?NefnyYjwKicRADtPX+m2dHA7lmaxYQBHKcOfq/dOSoho9m5Xd9Qj3aeDbkec?=
 =?us-ascii?Q?YhC4IBYmLpMp4o/QDX4I6qd6z9VuU8X8hAGEigVQqB58+W2ek9LUMw+/Zf6k?=
 =?us-ascii?Q?qM0pkehcQ8E6Sp+m6AbOZ7uFF4KYMmlA4UNzSndxa6ZErKlxKR/N4+XQXTqo?=
 =?us-ascii?Q?HQpr+LoCs7d9mfllG54MzcyefRVW7lzKlUaF5Eqnu+Abvi9AJdX48z4fzGtA?=
 =?us-ascii?Q?JAx5awN+0/xJ/ilxoCVk+qIgUF2TaEHEFCawK040?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPF84B7B0C96.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7142099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vTbdpeM85F+wFunXl1lj4s0wTMJj+qbKJz7V5tRl99DOw0F2AYt3l94YdynV?=
 =?us-ascii?Q?W4MPMorn9J2MMVJMicNJ8v1iFDAW5VD65HynYdruE0UQQOHfSBSVfM2Cph2t?=
 =?us-ascii?Q?BR2EeUmoVS1judF8///6WXM5RDFtVvysIVsm0+5GSGKTtsneCnCW2eX/LH/B?=
 =?us-ascii?Q?dOi5OyOtxf2FzBgrttcDzQnGYbfUVeyz3bix8dhrZmkiKGVYK0k0j16tbM2e?=
 =?us-ascii?Q?jipY9LPgT/NFDkIK7oBb8t/tR3fAt5JZz+98IeplwGEAhed4g+fEffRWAXNB?=
 =?us-ascii?Q?qxkQvcHO8wH9pmdJptG6ITopR2fodbKYX3g/xliidMFcSY6ARPy76jLw+DQZ?=
 =?us-ascii?Q?h0TlY37cZ9LMp6Cm+2TOTpZHUHXv5UPninjUj8EJxRlysCO6rK7jrRkbDzZy?=
 =?us-ascii?Q?GbUTjwhLCSwSPwDnM3jiryTaYCuvrZ8RaTg46yLij9WFvUt3h4bRMySf+SmF?=
 =?us-ascii?Q?aoJrkUSCdPt1nbDvVXUMPdBj9RCCgdzojCbf1LLdLW84+b7l1yNo2j3zuR2K?=
 =?us-ascii?Q?VdMLWXdeKpOreJi4HHhKLWtlgu30TK6qoaQogoD5qqNRckKr2YX859LGYVL+?=
 =?us-ascii?Q?iGWGqCNYZBT47s+vXGP1pWshtBi3PMa+nSjBstGI7UtpHv4YMu1iFaW9kJjs?=
 =?us-ascii?Q?Ct+aMOOJg8fG7oW6bGAzyCHfiZE/F1sWdaMGWkmrYL1qZGPaoXL71uLzt2EJ?=
 =?us-ascii?Q?fHLgNQQbGEH+EipVLiBAcaKXl/nBMsGJpxbUWbeMu+UnN5gSldtnb9uLCe6c?=
 =?us-ascii?Q?robHTxBhjnqWTzjVD/SGF1AHnzS1YMkISplpeznaqVhGU8EJLbyPu2vOwiB/?=
 =?us-ascii?Q?69yOMG/HwiNF1PcBOtl1qmOHT+MQWhR3BuQCiqdIwYK/uDdN0lrP0gsN86pS?=
 =?us-ascii?Q?9T398ph0WzcwAgw2bFIFr71jLY55R5P9GBQJYH3p1bxg0+P0x5gQhqTm114Q?=
 =?us-ascii?Q?e9925RE26OiYGwDp7SHIBCODDZC2D/DslbCyNyPmaGXDKkQP8Its2LEuQ5gw?=
 =?us-ascii?Q?+z3oChV+LZWZh/VdDF/z7VDYue+29pGDlPqJpz6gue4cNNejXDVs7KL18O36?=
 =?us-ascii?Q?yRcbDEu2VGg97JXgty8CUlFHbfD9dX7WAdFaFreMeHOE9Oz9uykDTko+tSwI?=
 =?us-ascii?Q?69mYmVawsP1Ux4ua8jUkm3lfi/WWlX9hMR0ij6pIaBZ9m/3dioIzsRu5R2K2?=
 =?us-ascii?Q?FytwQOb5+TgsQDl9ARKG+Dp10IL9RipMJuilHLy+AGC5p/XB+N4FmrATrNWi?=
 =?us-ascii?Q?QDgJKtud96AkOaHd1V3h4YktbmhYQoclm/Mg1+A2kVd4sFQg6pXFtiQPCpvC?=
 =?us-ascii?Q?hEjwfwMjFuSHO5hNwLHtQ1h1xNSUQ25UmE6ZNLAb1FWRZAJJKLX/La8J/bCn?=
 =?us-ascii?Q?JAWvgeznolnLjOC1TZUfcqvd2mgxz5V0WDcPxQfSbDEnVfn8c8ZxeXHpGtN1?=
 =?us-ascii?Q?qts59z2O1BfSIIznFLuoIpnnuQY0gj5cm27DNwe9oxs7KUmWXuuenrNUaZis?=
 =?us-ascii?Q?1p/JVdNUs/LRin9px/EcS4zIJa6YdWLiKA3gaMrPRdEbOC0Y5EPQQr0ozzTX?=
 =?us-ascii?Q?UWx2Ki3Lb52+7lx4hC0kq2h63pHziLWtKJNkPa+ANuE2GiSKFf3UceMAvr3h?=
 =?us-ascii?Q?bDQ41X+pcOhpc1oGYibpRgvYFz2PvucSvYydyoJApnmZH1X6tLU1WwZ4bgL5?=
 =?us-ascii?Q?t0Z9OB9drMddgsLqLmOnu4gyc7+5qz/xpHZzdzHPeAwCYJTS?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d58244a-1c63-4782-f165-08de6b071381
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 13:52:06.9353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +QbvFScrpPvE3lZSnX3hCaf81avXwqsKojdlPcM6DwNxk/Nqz8HmlmUQMlcCEf6uqBOMV6XDN1jPoCpXthr+UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6973

Hi Bill,

> From: Bill Mills <bill.mills@linaro.org>
> Sent: 26 January 2026 10:02 PM
>
> This series adds the virtio-msg transport layer.
>
> The individuals and organizations involved in this effort have had diffic=
ulty in
> using the existing virtio-transports in various situations and desire to =
add one
> more transport that performs its transport layer operations by sending an=
d
> receiving messages.
>
> Implementations of virtio-msg will normally be done in multiple layers:
> * common / device level
> * bus level
>
> The common / device level defines the messages exchanged between the driv=
er
> and a device. This common part should lead to a common driver holding mos=
t
> of the virtio specifics and can be shared by all virtio-msg bus implement=
ations.
> The kernel implementation in [3] shows this separation. As with other tra=
nsport
> layers, virtio-msg should not require modifications to existing virtio de=
vice
> implementations (virtio-net, virtio-blk etc). The common / device level i=
s the
> main focus of this version of the patch series.
>
> The virtio-msg bus level implements the normal things a bus defines
> (enumeration, dma operations, etc) but also implements the message send a=
nd
> receive operations. A number of bus implementations are envisioned,
> some of which will be reusable and general purpose. Other bus implementat=
ions
> might be unique to a given situation, for example only used by a PCIe car=
d
> and its driver.
>
> The standard bus messages are an effort to avoid different bus implementa=
tions
> doing the same thing in different ways for no good reason. However the
> different environments will require different things. Instead of trying t=
o
> anticipate all needs and provide something very abstract, we think
> implementation specific messages will be needed at the bus level. Over ti=
me,
> if we see similar messages across multiple bus implementations, we will m=
ove to
> standardize a bus level message for that.
>

I would review more, had first round of sparse review.
Please find few comments/questions below.

1. device number should be 32-bit in struct virtio_msg_header.
From SIOV_R2 experiences, we learnt that some uses have use case for more t=
han 64k devices.
Also mapping PCI BDF wont be enough in 16-bits considering domain field.

2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
For example, a TCP stream wants to send 64KB of data + payload, needs more =
than 64KB data.
Needs 32-bits.

3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (instea=
d of READY)
But more below.

4. I dont find the transport messages to read and write to the driver memor=
y supplied in VIRTIO_MSG_SET_VQUEUE addresses to operate the virtqueues.
Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
Also, the queue notification message is missing at bus level.
But I dont think queue notification via message good idea anyway.
We rather need a more higher-level message for virtqueues.
Such as posting the descriptors to device. And this should translate into a=
 VIRTIO_MSG_DESC_SEND or bus specific binding.
Without this msg transport is incomplete.

5. msg_id to be renamed to msg_opcode, and token to be renamed to msg_id as=
 it identifies the msg (as written in the description) in

6. Bus requirements ordering is too strict for implementing any performant =
data path as data response may not be in same order as request for reads.

7. VIRTIO_MSG_SET_VQUEUE does not have bit field for individual addresses.
This requires caching all the values on the driver side before sending the =
transport request.
I think it is time for virtio spec to shift to virt queue create and destro=
y model using the admin queue interface.
and no need to bring this VIRTIO_MSG_SET_VQUEUE legacy to new transport bin=
dings.
It may require more plumbing, but it is cleaner interface when a new transp=
ort binding is created.

8. We should have the message response header for req-resp method with stat=
us code.
(even though they are plain MMIO writes for pci).
As opposed to that, proposed messages are doing composite tasks, hence we n=
eed the status response.

9. virtio stack cannot handle hotplug devices today, at least Linux.
So if the intention is to fit into such a system, DEVICE_BUS_STATE_REMOVED =
will not be enough.
A graceful method is needed.

> We are working on a few reusable bus implementations:
>
> * virtio-msg-ffa based on Arm FF-A interface for use between:
>   * normal world and secure world
>   * host and VM or VM to VM
>   * Can be used w/ or with out a hypervisor
>   * Any Hypervisor that implements FF-A can be used
>   * We have this working with pKVM and Xen
>   * We have this working with Trusty and OP-TEE
>
> * virtio-msg-amp for use between heterogenous systems
>   * The main processors and its co-processors on an AMP SOC
>   * Two or more systems connected via PCIe
>   * Minimal requirements: bi-directional interrupts and
>     at least one shared memory area
>   * hvac-demo has 2 demos of this
>   * This is working on two hardware platforms
>
> * virtio-msg-loopback for userspace implemented devices
>   * Allows user space to provide devices to its own kernel
>   * This is similar to fuse, cuse or loopback block devices but for virti=
o
>   * hvac-demo has a demo
>
> We also anticipate a few more:
>
> * virtio-msg-xen specific to Xen
>   * Usable on any Xen system (including x86 where FF-A does not exist)
>   * Using Xen events and page grants
>
> * virtio-msg over admin virtqueues
>   * This allows any virtio-pci device that supports admin virtqueues to a=
lso
>     support a virtio-msg bus that supports sub devices
>   * [We are looking for collaborators for this work]
>
> Changes since RFC2:
>
> Spec Functional:
> * Made the common message header 8 bytes and added a token for optional u=
se
>   when parallel outstanding requests are possible
> * Made the 8 byte fields align to 8 byte offsets.
>   This effects the {SET,GET}_VQUEUE messages
> * Many conformance cases have been tightened.
>
> Spec Editorial:
> * Major restructure to better align with virtio spec
>   * Conformance model now matches other transports
>   * Use C structures to define messages instead of tables
> * Added a section to describe how responses are matched to requests
>   This includes the use of the new token field
> * Redefined / better described error handling between transport and bus
>   layers to eliminate the need for the bus to generate fake response mess=
ages
> * Included editorial feedback from RFC2
>
> Eco-system:
> * Added virtio-msg-loopback demo
> * Arm has published the first draft of the virtio-msg over FFA spec [6]
> * virtio-msg over FFA has been demonstrated with both Trusty and OP-TEE
>   secure world
> * LKML RFC has been sent [7]
> * QEMU RFC has been sent [8]
>
> This is the first non-RFC patch series. The known short comings have been
> addressed. We ask for review in earnest on this series and thank you for
> any feedback you can provide.
>
> Background info and work in progress implementations:
> * HVAC project page with intro slides [1]
> * HVAC demo repo w/ instructions in README.md [2]
> * Kernel w/ virtio-msg common level and ffa support [3]
> * QEMU w/ support for one form of virtio-msg-amp [4]
> * Portable RTOS library w/ one form of virtio-msg-amp [5]
>
> In addition to the QEMU system based demos in the hvac-demo repo, we also=
 have
> two hardware systems running:
> * AMD x86 + AMD Arm Versal connected via PCIe
> * ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr
>
> Please note that although the demos work, a few have not been aligned
> with this version of the spec.
>
> [1]
> https://linaro.atlassian.net/wiki/spaces/HVAC/overview
> 05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf88d95%7C43083d1=
5727340c1b7db39efd9ccc17a%7C0%7C0%7C6390
> 50419790817373%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLj=
AuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs
> IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DJnCO8QgAIiyGAprBLkprUd8A3162wCFpmGi=
c3JKoHXo%3D&reserved=3D0
> [2] https://github.com/wmamills/hvac-
> demo&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf88d=
95%7C43083d15727340c1b7db39efd9ccc17a%7C0%7
> C0%7C639050419790868944%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsI=
lYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj
> oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DXeBuS8Hr%2FDETKfSyidKKGoG=
q6OTUcOYoeSGDouUMcf4%3D&reserved=3D0
> [3]
> https://git.kernel.org/pub/scm/linux/kernel/git/vireshk%252
> Flinux.git%2Flog%2F%3Fh%3Dvirtio%2Fmsg&data=3D05%7C02%7Cparav%40nvidia.co=
m%7Cf7f430294c37485df25808de5cf88d95%7C43083d1
> 5727340c1b7db39efd9ccc17a%7C0%7C0%7C639050419790913867%7CUnknown%7CTWFpbG=
Zsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C=
&sdata=3DPuLq68Y0ZNCYbfrgDZlipfm44xHZp1%2F%2
> BLu%2FaKQBBB%2Fo%3D&reserved=3D0
> [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-
> msg-
> rfc%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf8=
8d95%7C43083d15727340c1b7db39efd9ccc17a%7C0%
> 7C0%7C639050419790960971%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUs=
IlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFO
> IjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DxyowKD9KG3IasQTiYCzfCRG=
qCLSF%2Fa1g4%2F2%2ByKb1OoA%3D&reserved=3D0
> [5] https://github.com/arnopo/open-amp/commits/virtio-
> msg%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf8=
8d95%7C43083d15727340c1b7db39efd9ccc17a%7C0
> %7C0%7C639050419791007707%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWU=
sIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkF
> OIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D69OwO2wXi0%2FEhDDSR2uL=
G2iis5RYzI%2FLnlfkcRYao9o%3D&reserved=3D0
> [6] https://documentation-/
> service.arm.com%2Fstatic%2F68f647791134f773ab3f0a7c&data=3D05%7C02%7Cpara=
v%40nvidia.com%7Cf7f430294c37485df25808de5cf88d9
> 5%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C639050419791052848%7CUnkno=
wn%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRy
> dWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%=
7C0%7C%7C%7C&sdata=3DcD5VqKnTuIFqlN2XV3j%2FHQ
> Wvsz8UVe5PM0ZjMU3o0sM%3D&reserved=3D0
> [7]
> https://lore.kernel.org/all/cover.1753865268.git.viresh.kumar@linar
> o.org%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5c=
f88d95%7C43083d15727340c1b7db39efd9ccc17a%7C
> 0%7C0%7C639050419791093596%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydW=
UsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsI
> kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DNmhmL%2BuyVqnpHT5r9E=
fI2uzPf9LSXLga7bUw3FO5x4w%3D&reserved=3D0
> [8] https://mail.gnu.org/archive/html/qemu-devel/2025-
> 10%2Fmsg07438.html&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485d=
f25808de5cf88d95%7C43083d15727340c1b7db39efd
> 9ccc17a%7C0%7C0%7C639050419791139232%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1h=
cGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
> XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DosI1FttOO9=
%2B01e%2B5EtwnYe%2Fl1%2BIvFjH%2Blyz2ipM3RM
> Q%3D&reserved=3D0
>
> Bertrand Marquis (2):
>   virtio-msg: add new command for bus normative
>   virtio-msg: add conformance entries in conformance chapter
>
> Bill Mills (2):
>   virtio-msg: Add virtio-msg, a message based virtio transport layer
>   virtio-msg: link virtio-msg content
>
>  commands.tex      |    3 +-
>  conformance.tex   |  105 ++-
>  content.tex       |    1 +
>  transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1746 insertions(+), 3 deletions(-)
>  create mode 100644 transport-msg.tex
>
> --
> 2.34.1
>

