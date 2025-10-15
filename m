Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012003.outbound.protection.outlook.com [52.101.53.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85263299AAF
	for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 03:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760498992; cv=fail; b=ksUL0PYDBOKIRFnxWvT0VEmJwzxZy1dRlTR1TjmfcaJWBeg2NHLKuy/aHCIeQReCfTYE7IBdG1+IK+4Qs8etjcsOntWxyK7FY1pH+ryAL4xcuzQtHV5NiRdEVXDOFAB7BUOAkAISRgS3hAeY2mBxqUvYoxM8gJtwVWIimBWTDng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760498992; c=relaxed/simple;
	bh=WOEJKVDdLqgGWmYlL4MP2QiQ1t8eyW6vecJAprukrQY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k6LlHPcjdjt4dcJFPSyGpWwE0Q041Z17T6Xtq6ASymeUL/BgaJs3DZofAupXXNqIi9vI+KUlCb+34cjkFrVyly+GocNtEtHDi5DZkLkFU8mhCTaT+/3azNHrK/DfFZTJ2VZTC1bIy8A6tYVgS5oWzydCSSvxxZmaaWiTvNPPbEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dCJzYJbR; arc=fail smtp.client-ip=52.101.53.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dCJzYJbR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsiNYxC3DY1W1xexbMU+guyAGx8439Cr6xEPs5DNeiVcVQm490kIrgnALjx77p20+y9HrlNp2HZJvpFFGSioRKkiHOu8Rhqm7roicw2eA9Fs1+epQJ5Wdiw2kBuMKR8gN+kE4f+W6uBwjUkJ/BtU3UG9CIv3CFIeIbJ/p6+65h3PwudOjvM+EjeXzToIKX0LLiHAIlaYS8csoCqySJYW7Tg+xTRfNb4lJ0uP3xL5Am/bncTM7B4uT9Vq9xeOWFxzdORVaq4yy+Ksof67IteDQfmW3VwhoiYwsDVkcnI+xBrjouSEbnrK/gJFs1+hxmk+psvvrPa60WpkXUTvVWd3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nK/KGXjvj7B8L90Z/TUqZV+tvlfJCKLo7s5luBia4jM=;
 b=eG6uTFQwx0jqzq4L/zgtHS1EeoahO0LV5RDTq/lvQgqz/ZEyGxQb21AG6eK0CSM0UjNYgrrkLfWEjRCKgoEyJZFdVbV/Lr0rUvKRnsoLj4IfV+ejJ6pwDjHB6BmTdDyGsUWeZdLbzrUYXJvnH+/7iXl84qAUtLarj5+kK0yeNGHS0sEVIvrzdGiKNALchqrZFPBwTa1D2vbqvBoMXdls2DtHH+qnRrtSvQZex9uhcCRwYda5KgGLqSyLktvCLz3epOJ+2qgzVowqlp92CKJd4ij8cOCcrFqNPMU4lFD28448CMCpAtTFAO0lbD2Vl4jUz/w0XY1gSUxe4cOEk1agSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nK/KGXjvj7B8L90Z/TUqZV+tvlfJCKLo7s5luBia4jM=;
 b=dCJzYJbRIqVqRiHWIrAbX3SE9PBQZafUbuJEGOr2HjnbUGqzT/KJZhXNruliRPK8b0sGzJw7XjjZ0t2bfsoWBDwks+A/6FUB55Wu1FglwVGt+4mOLMKWIWBFVkovDKbOKkTpl7Xa0obHRA48s4RFFQkK8+8zQqbbUKGmic6Su3whbtBxd+rIvpZ2qPRtHcS8elPd+KCmD2tutCMHy2dlfoalTRqASS8VfHoVOT/79FPMlWvNZmzMbcdjkji4T/NZuUnhfWZByCNWJ/yEvpX/h8mM7fklnttmAUXaxtZaCY1IZfUiYn4TCddHvD5+ayWE/DamPmq45ZBvU/gCXpRf2w==
Received: from PH8PR12MB7208.namprd12.prod.outlook.com (2603:10b6:510:224::7)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 03:29:45 +0000
Received: from PH8PR12MB7208.namprd12.prod.outlook.com
 ([fe80::1664:178c:a93e:8c42]) by PH8PR12MB7208.namprd12.prod.outlook.com
 ([fe80::1664:178c:a93e:8c42%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 03:29:39 +0000
From: Parav Pandit <parav@nvidia.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ij@kernel.org>
CC: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index:
 AQHcDRMxc7D2+BxJGUa3jiZ0uZVtV7SqECZQgACnIACAALBIAIAAa1mAgAEnxVCAADbEAIAANhWAgAAbXICAAwZbwIAAFfmAgAAMFGCAABRiAIAAMbdwgABX7wCABWkngIAJRiFggAKBUgCAAHMSkA==
Date: Wed, 15 Oct 2025 03:29:39 +0000
Message-ID:
 <PH8PR12MB720866C253E9C7361F88FC1EDCE8A@PH8PR12MB7208.namprd12.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <PAXPR07MB79847467B33487A8F0CA5ED5A3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719518C4A8F3EE03690E44B1DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79845B9580C4D17590E8C2DEA3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB71959308B23EFE2A920D8B20DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79841A2F8A719FDAD35AB0D0A3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719590ED886A60EE7867E7E6DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79846714E156C1797667F6ABA3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
  <CY8PR12MB7195DF4B90E52B22D33964E0DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <d92b8614-6cf8-d704-01ab-b89094486f52@kernel.org>
 <PAXPR07MB798491A0140F43FFE17384D8A3E0A@PAXPR07MB7984.eurprd07.prod.outlook.com>
  <CY8PR12MB719595914FDED764977E6105DCEAA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <f0c03e3e-c1d0-73d7-c4dc-c95fc0248207@kernel.org>
In-Reply-To: <f0c03e3e-c1d0-73d7-c4dc-c95fc0248207@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB7208:EE_|CH0PR12MB8530:EE_
x-ms-office365-filtering-correlation-id: 997b1729-6b03-4ee5-6847-08de0b9b12b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oZm/x38Mu4DCDFpC9cZtzhEG3uD5JvUiOzyJSw56eG9umhj5NuFWoQX02m?=
 =?iso-8859-1?Q?QUQ7vvg69EJvvKR/Y9ABIi9R0bs9YavOTqXq6H+bW2YKWKyfVAelF5/iaX?=
 =?iso-8859-1?Q?xBOxPVR7Kn3nkvAdN7v6N9YDjufBzunD84tO0ecvF8wy2RfWuQ6fWGMq5m?=
 =?iso-8859-1?Q?Kp3T0tDdgsiuJjI9r3Vu+rmoKTygEE8EHb8JPXD2f0atC1yyjpv/ORmg73?=
 =?iso-8859-1?Q?x0Tlu5UiO7m/ztGTfuCFmeA++hLMx/38PUl2iMLpssHQel+EjLsQK1cd6w?=
 =?iso-8859-1?Q?wUiTcQEeST50wPpXOj8M6x3h4ov+yIHZDpdSwryx/ODPRi5hzAgqUESPCH?=
 =?iso-8859-1?Q?oM2l+2T0uFzSDq8P5iAwgR/RQR5sZ9S2lQIUQHJVvH+oRf4aLQsHuBhQ9u?=
 =?iso-8859-1?Q?4PyQQkm6U3YvO3+lnKMFCbahmv/KlT8oKzIuvYXG8DyeHyjA4b7eS1FW0H?=
 =?iso-8859-1?Q?mv7IITojHfX83w1xJYcHCsM5RvdSoQitobMKoVH+HADcCcSjqbyjHSgsRt?=
 =?iso-8859-1?Q?doLqPYrurn/EjCkPPYyJ1k0I3q3kdBQ/NnsAtSZaoRWPcwG6FepPX3RWmd?=
 =?iso-8859-1?Q?VSKtrGUdn12NiYDhRwA3iRoQSCUm+DFVxpf99hNu/8IeJMuudAfSR/vEsC?=
 =?iso-8859-1?Q?mbTMzDIwJ1+KiF6VpJ2khNK9VdOp5zNjPiFbVWmgqC0cD+tpDZgBquKwOs?=
 =?iso-8859-1?Q?giy6JHFM3ndInYNu+on30r1WrxJrTpY+NG4Lf43sIb2jZDi9X5XTes7tDn?=
 =?iso-8859-1?Q?IbGQML14PIfFwYT7j3pr+buiNp7WkrPiB9LD7g0B2reNXvdtSJy2TQ8F3u?=
 =?iso-8859-1?Q?oR1nyp8ozUcjxNww9k2mpkvHbqXnSaflupREjKn7WKIn21axkJ5tads1mb?=
 =?iso-8859-1?Q?NI3TMcdd3C71AvCvwRfH25ZkqsyWUBE4Ap6wielY4qYsdfe1ODjQWO0XHW?=
 =?iso-8859-1?Q?oYEQk4PIrvqdY7IL3tvgeL+ar/afy3B9q62UDbPd2BrFjsHAf4nP2oO8rz?=
 =?iso-8859-1?Q?EcumNQY6hYxSrm+bzOv/7df/qbW4oG+Q9og6lglbHTEahx2QciuwHl1zLw?=
 =?iso-8859-1?Q?E2pb8BMXlRPPfve+L2tE3AWWjkp5san7QarVwmO4AHJrfuQ9JlMk4n8U5C?=
 =?iso-8859-1?Q?v+4sd/S4FUE/3quA/IkDYc8r9+rIQ2aC45jeqlfSpVNzYXF2xQR7n2GyQ3?=
 =?iso-8859-1?Q?J3nmaPg+I6jmr/Ij3DeWjGCUcICVtOzlmKhgnn9zXm7D980X/AgQFRmtBH?=
 =?iso-8859-1?Q?Rjmn76nDfgRDazxYlkDtM/W/AJA9Ciu12T9aZmd3lpZJk1rPqlkVQlr9iG?=
 =?iso-8859-1?Q?YFjvoW8pMimdI0FHf21gN2Gz/6FlLwJuCmEJJsDgQl6Ud+CxZT6iqzYYda?=
 =?iso-8859-1?Q?yJQL7D3WDa2kY+NKGKMaRGnDWBrx9mHG7pB7zhnf//004njvMDZb+oGs6Z?=
 =?iso-8859-1?Q?VgtP8G6GVhr1vdLKlKYlEVOgMUGEuRs0SqrlOBoriYRL1VjNjJiiS6XxKT?=
 =?iso-8859-1?Q?wa6EylKKxE8yxONVfQZHumRef+5OoE6s97XyeOJPeIZyqfq86jzQmLMRqj?=
 =?iso-8859-1?Q?8kYV1uC6qDXsAvanWjuaI9Ntvm9M?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7208.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?93Ph+7BUhhLgCTtLnVEtywevzpVHkpJSjIWcL64YG/9yYPLP3KLbQRPdo9?=
 =?iso-8859-1?Q?54ZJmdYIaZvR6VE86k4adFjmnJk/+TalJa18jJdKpXWM2/TFaDFfrPJxAA?=
 =?iso-8859-1?Q?DJqwU+GlNALU6IcituZ4+G2OJ0cPFsx5PQiAknCgyfIuk3MA2LMad6rm1b?=
 =?iso-8859-1?Q?a9TLj8Hh/EtsJ6y87cLa0sPGfjayyd+neau1DvuffNRmFd0u5hqbJFS0An?=
 =?iso-8859-1?Q?uTPJKU2Ve3ln/BKdhcuHIC452HjoVxDkL3GQPUhI8ghVfz8P7ReyqZXw4N?=
 =?iso-8859-1?Q?K9Ues/4YmtnnIO6wEudbBtMYr9odIj3E/QCmacNL2O/RQktK7ZZXfo3zLo?=
 =?iso-8859-1?Q?TN3Q8wmzz2/I8LeLk4QXI6mm7X501mcUuzTfQvKNatfBJX79Ri7qISe9vk?=
 =?iso-8859-1?Q?tNyTic/yEda4OE1XcwN3EBNKT2j6px09QGa29jeAgQ3cAY3GRvBnyGa8ca?=
 =?iso-8859-1?Q?hV52QZp6OqoK6v7O2/Ad0EG4yVJzA4uI+WUM87LIKySkwlRU2Db9H/O2XI?=
 =?iso-8859-1?Q?rCK1EDDvhGwhHHbMqWgONzJKDIRExn0HqceKIySrWzKEfNQ/tMmcynlIh8?=
 =?iso-8859-1?Q?WQaixomOwSb+cPo9qlpKBYyBCsgLEnrjoOr5zzvtrJtt9nBvkKtLq20CZg?=
 =?iso-8859-1?Q?Vuxa+T2KRQkhvleP4aEQwtYcu0x1UoFN7MbvAfcTUbRobdndBirk1ol482?=
 =?iso-8859-1?Q?AVACX091jzemPxbmQRX+ccpIigqYpz28wB8e7twiBVqTn6Yg0gCnNd7KOJ?=
 =?iso-8859-1?Q?SjCHZn7/+oxrqG7yVGTWN5x7zlsJfEU8WSCHwfEoNQFdyI1oRSqe2YTq9i?=
 =?iso-8859-1?Q?eujYgln9dPuqIVAls9sf2Bi7779f16yK+G8CNwaO0t9ArfZqDiN+1E+xlv?=
 =?iso-8859-1?Q?oUmh8xsSH+k84fgioOYcaqa/jAwiqOJO4ELH0QdW9ZyxoyEJ33BEviz8CX?=
 =?iso-8859-1?Q?3iZbvNNHad3tfl0sgLFqkhNYjhvzMheLk+tLCO4GoE1Xy1cYoxO8jY2lOw?=
 =?iso-8859-1?Q?n6l9n8lxniNKZqWKy7pqfYO2dX1fLaSX874veDM+95e9nJF0LhtEjQlSDY?=
 =?iso-8859-1?Q?8Q4lJ+kkX756UDmtPNuM9XeTK9i4tRNeSNsVV0i/WQcJUqtnd8kTO/lA/r?=
 =?iso-8859-1?Q?sKf0MMNO/ChuW5+CVXxKpeCRe4GJ+uWvxh7WxExHY8LpzSsyzVHgnXAL/d?=
 =?iso-8859-1?Q?mRLnODHdsUPTrc3trdbKSPpNJRgh+MrNguC9P5mPbFmpUH6gVO+9xjc9i9?=
 =?iso-8859-1?Q?ScIMKC/lOswr6tf+Vxnp6uJyRvrKpXCBNDl7V0mTMapiKZjXVHMGkH3dWW?=
 =?iso-8859-1?Q?nHqdtq60qXY/Jo/mTBCmMSt4+ZyJMgE/B5t6RwKaFW9HWb8e+xi1TZ8dbB?=
 =?iso-8859-1?Q?HDe6y/zkA+skckfeXJusoIxG8hp5Zykfhi5ERPS97xGTxZ3RN4ZrQE1rO4?=
 =?iso-8859-1?Q?O44TIpePDnoI7BDchp03RPU8jAb95LVJCteQLxbBvXTIXpFipMAhnlzIMA?=
 =?iso-8859-1?Q?B81gvdD8EIjtkiUnTIax8VFyyY/OjG95hwTO9PJNzwL2Rhldy67RSZGmWJ?=
 =?iso-8859-1?Q?xcyYoIoiI0CT2O4h4xtrsbtcr5dgtm1gbdqBKgURBY/B4PyLGNYYZfWYkr?=
 =?iso-8859-1?Q?9/YTcO16YpojB3JwiroCoqSeIB4Qcp2nztMax4TXrfLTWdiePY1EkP7RKQ?=
 =?iso-8859-1?Q?orct9Y5QR7PmEgNbRok=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7208.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 997b1729-6b03-4ee5-6847-08de0b9b12b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 03:29:39.4546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 34C3GyIp6Be1or8+GZi57PHA35bPz+JyCDkFYdA7X4nLCeRE89S7K+ie23S1EOi+sCZ7lKmKPCRQvRrXMLrE6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530



> From: Ilpo J=E4rvinen <ij@kernel.org>
> Sent: 15 October 2025 02:05 AM
>=20
> On Mon, 13 Oct 2025, Parav Pandit wrote:
> > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > Sent: 07 October 2025 02:12 PM
> > >
> > > > -----Original Message-----
> > > > From: Ilpo J=E4rvinen <ij@kernel.org>
> > > > Sent: Saturday, October 4, 2025 12:05 AM
> > > > To: Parav Pandit <parav@nvidia.com>
> > > > Cc: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> > > > mvaralar@redhat.com; jasowang@redhat.com;
> > > xuanzhuo@linux.alibaba.com;
> > > > eperezma@redhat.com; ncardwell@google.com; Koen De Schepper
> > > > (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > descriptions
> > > >
> > > >
> > > > CAUTION: This is an external email. Please be very careful when
> > > > clicking
> > > links or opening attachments. See the URL nok.it/ext for additional
> > > information.
> > > >
> > > >
> > > >
> > > > On Fri, 3 Oct 2025, Parav Pandit wrote:
> > > >
> > > > > > > > > You described,
> > > > > > > > >
> > > > > > > > >     If NIC is completely unaware of RFC3168 ECN (doesn't
> support
> > > > > > > > >     NETIF_F_TSO_ECN) or its TSO engine can be set to not
> > > > > > > > > touch
> > > CWR flag
> > > > > > > > >     despite supporting also NETIF_F_TSO_ECN, TSO could
> > > > > > > > > be safely
> > > used
> > > > > > > > >     with AccECN on such NIC. This should be evaluated per=
 NIC
> basis
> > > > > > > > >     (not done in this patch series for any NICs).
> > > > > > > > >
> > > > > > > > > Based on above commit log, can we say that when existing
> > > > > > > > > GSO_ECN is not
> > > > > > > > negotiated, ACCECN can work as_is without the patch_2?
> > > > > > > > >
> > > > > > > > > [1] commit 023af5a72ab16 ("gso: AccECN support")
> > > > > > > >
> > > > > > > > Indeed, this patch description implies that NIC that
> > > > > > > > currently don't support TCP_ECN will naturally support ACCE=
CN.
> > > > > > > > But an extra TSO_ACCECN flag will make this into an
> > > > > > > > explicit requirement, like our patch in the Linux.
> > > > > > > >
> > > > > > > If so, the 2nd patch should word saying, the device must not
> > > > > > > modify IP
> > > > > > congestion code point bits and TCP ACE bits.
> > > > > > > All packets in the segment offload must have same bits.
> > > > > > >
> > > > > > > Similarly on RX side for GRO, the device requirement to
> > > > > > > spell out that GRO
> > > > > > stream to break when two subsequent packets have different bits
> etc.
> > > > > > >
> > > > > > > If you can help to understand why RX side should set this
> > > > > > > and how one may
> > > > > > plan to use it, it makes sense to define the GUEST bit.
> > > > > > > Presently it does not look useful for rx side (guest bit).
> > > > > > >
> > > > > > > > Related to another email about existing driver, one
> > > > > > > > solution would be replace SKB_GSO_TCP_ECN with
> > > > > > > > SKB_GSO_TCP_ACCECN,
> > > like
> > > > > > > > in 4e4f7cefb130af6aba6a393b2d13930b49390df9.
> > > > > > > > This can avoid CWR corruption somewhere after GRO, and we
> > > > > > > > plan to submit related patches (old driver,
> > > > > > > > virtio-related) into net-next after this is approved in vir=
tio-spec.
> > > > > > >
> > > > > > > Commit 4e4f7cefb130a looks incorrect to me, or I must be
> > > > > > > missing
> > > > > > something.
> > > > > > > It looks incorrect to me is because:
> > > > > > > 1. SKB_GSO_TCP_ACCECN is set when cwr is set, regardless of
> > > > > > > tcp socket
> > > > > > following rfc3168 or accecn.
> > > > > > > I was hoping to set this flag only when its accecn.
> > > > > > >
> > > > > > > 2. Even though it is set, it is not read by anyone, so not
> > > > > > > sure why one would
> > > > > > set it.
> > > > > > >
> > > > > > > 3. It appears to me that it is TX side flag and rx GRO
> > > > > > > should not be setting it,
> > > > > > because there isn't rx side code to handle it yet.
> > > > > > > May be this is part of some multi series work?
> > > > > > >
> > > > > > > 4. The commit 4e4f7cefb130a claims to prevent field corruptio=
n.
> > > > > > > A corruption sounds like a bug. And if it is a bug, it the
> > > > > > > patch needs fixes tag,
> > > > > > but it does not have it.
> > > > > > > Probably no fixes tag, because no users, that is strange
> > > > > > > kernel code to
> > > me.
> > > > > >
> > > > > > Please let me elaborate more.
> > > > > >
> > > > > > Patch 023af5a72ab16 is in tcp_gso_segment(), so it
> > > > > > disaggregates packet on the TX side after TCP stack.
> > > > > > Before patch 023af5a72ab16, CWR flag from the 2nd packet will
> > > > > > be cleaned if TSO_ECN is set by RFC3168 ECN in tcp_output.c
> > > > > > New TSO_ACCECN will be set by AccECN protocol in tcp_output.c,
> > > > > > indicating that this packet does not want CWR flag cleaning
> > > > > > from the 2nd
> > > packet.
> > > > > >
> > > > > I understood the commit 023af5a72ab16 and commit looks good to
> me.
> > > > >
> > > > > > Patch 4e4f7cefb130a is in tcp_gro_receive(), so it aggregates
> > > > > > packets on the RX side before going to TCP stack.
> > > > > > And you can see before 4e4f7cefb130a patch, TSO_ECN flag will
> > > > > > be set if cwr is 1.
> > > > > SKB_GSO_TCP_ACCECN and SKB_GSO_TCP_ECN are mutually exclusive.
> > > > > So not sure how gro receive commit 4e4f7cefb130a replaces
> > > > > TCP_ECN with
> > > ACCECN.
> > > > >
> > > > > But regardless of that, you explain that rx side can set skb
> > > > > field based on how device has coalesced the packet, And tx side
> > > > > can use the
> > > same skb when using tcp/ip stack as router/forwarding unit.
> > > > > (instead of terminating/originating tcp connection from the socke=
t).
> > > > >
> > > > > > This TSO_ECN flag implies that it's ok to segment this
> > > > > > aggregated packet and clean CWR from the 2nd packets by latter
> operations.
> > > > > > But this is NOT ok for AccECN protocl, new TSO_ACCECN flag
> > > > > > explicitly tells latter operations that it's NOT ok to clean
> > > > > > CWR from the
> > > 2nd packets.
> > > > > >
> > > > > Right.
> > > > >
> > > > > > And the corruption in the commit message means the CWR flag
> > > > > > cannot keep the origianl value (i.e., been reset by latter oper=
ations).
> > > > >
> > > > > If the code reset the value when it should not, it means it was
> > > > > bug and needs fixes tag.
> > > >
> > > > It was intentional for RFC 3168 ECN offloading to the reset the val=
ue.
> > > > In the traditional sense it isn't "bug" because it was done intenti=
onally.
> > > > "When it should not" too, should considered with the background
> > > > this
> > > offloading feature has (from era when AccECN didn't exists at all).
> > > But it's fine to end up disagreeing on this detail about Fixes tag,
> > > in any case that commit is immutable now so this discussion is pretty
> moot :-).
> > > >
> > > > > Anyway, I don't want to diverge on the discussion.
> > > > >
> > > > > Seems like setting SKB_GSO_TCP_ECN seems fine even on rx skb too.
> > > >
> > > > SKB_GSO_TCP_ECN will not replicate the same TCP header flags in a
> > > forwarding scenario:
> > > >
> > > > Segment 1 CWR set
> > > > Segment 2 CWR set
> > > >
> > > > GRO rx and GSO tx with SKB_GSO_TCP_ECN, after forwarding outputs
> > > > these
> > > > segments:
> > > >
> > > > Segment 1 CWR set
> > > > Segment 2 CWR cleared
> > > >
> > > > Thus, the ACE field in Segment 2 no longer contains the same value
> > > > as it was
> > > sent with.
> > > >
> > > > As rx side, generally, does not know if the sender is using AccECN
> > > > or RFC
> > > > 3168 (or some entirely different semantics for these flags as
> > > > these TCP
> > > features are negotiated). I said "generally" because it would
> > > required connection tracking to know it which is expensive and has it=
s
> own challenges.
> > > >
> > > >
> > > > If you, on the other hand, imply that SKB_GSO_TCP_ECN could just
> > > > become
> > > SKB_GSO_TCP_ACCECN just by declaring this corruption a "bug", that
> > > too is not possible.
> > > >
> > > > Or to be more precise, that would mean removing RFC 3168 ECN
> > > > offloading
> > > support from the tx side (where it may have some, albeit IMO quite
> > > limited [*], performance benefits). When we're TX'ing segment the
> > > kernel knows originate from RFC 3168 sender as indicated by
> > > SKB_GSO_TCP_ECN flag, it can safely perform the RFC 3168 offloading
> without fear of corruption.
> > > >
> > > >
> > > > [*] RFC 3168 CWR is only sent once per RTT so those segments
> > > > should not
> > > appear very frequently. What RFC 3168 offloading does is effectively
> > > allow CWR to be send within the same super-skb with non-CWR segments
> > > as the RFC 3168 offloading with SKB_GSO_TCP_ECN ensures CWR is only
> > > sent out in one segment. Without SKB_GSO_TCP_ECN, the sender would
> > > have to send CWR segment separately (this potentially comes with a
> > > minor performance cost).
> > > >
> > > > > So you should just refine the wordings for patch 1 and 2 to
> > > > > match exactly what it means for virtio spec requiirements and
> > > > > description section.
> > >
> > > Thanks Ilpo for example above, and I just realized that the mail
> > > server miss- resend an old email on Sunday, sorry for spamming.
> > > And I hope above explanations related to the CWR flag are clear.
> > >
> > > One more thing I would like to raise is about the ECN flag mentioned
> > > in current virtio-spec.
> > > As SKB_GSO_TCP_ECN is not related to IP.ECN in RX path even before
> > > 4e4f7cefb130a patch, and neither in TX path before 023af5a72ab16.
> >
> > Can you please discuss with the netdev maintainer and clarify the usage=
 of
> SKB_GSO_TCP_ECN.
> > i.e.
> > a. does SKB_GSO_TCP_ECN apply to RX side? From the name of "GSO" it
> does not seem so, but three drivers hns3, mlx5, virtio-net are using thes=
e on
> the RX.
> > If this applies to the RX also, can we please send comment update
> > patch to net-next to update, include/linux/skbuff.h
> >
> > Something like:
> >
> > --- a/include/linux/skbuff.h
> > +++ b/include/linux/skbuff.h
> > @@ -671,7 +671,9 @@ enum {
> >         /* This indicates the skb is from an untrusted source. */
> >         SKB_GSO_DODGY =3D 1 << 1,
> >
> > -       /* This indicates the tcp segment has CWR set. */
> > +       /* This indicates the first tcp segment has CWR set in GSO or G=
RO
> stream.
>=20
> Hi,
>=20
> It feels little odd to me to make such a change to a comment now if the w=
hole
> point with AccECN is that SKB_GSO_TCP_ECN can no longer be safely used on
> the rx side.
So SKB_GSO_TCP_ECN will be overloaded where if AccECN is negotiated, GRO st=
ream contains IP+TCP bits as per AccECN
And without accECN negotiated, only the first segment will have ECN bits?

If so, can the header comment be updated in such a way?
