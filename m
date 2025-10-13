Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5B12E283E
	for <virtio-comment@lists.linux.dev>; Mon, 13 Oct 2025 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760336789; cv=fail; b=iTp6L8jO96lmHqlwisJM0pNIgTFWSzBBkWOPQwRlTQbDZgAPOw/ajQlhZk38GexgIPlXCnwvlWmAMzwbIL39jnxEZdKH+D3OyYp9IR+BmDKCYZbxwdtJa6/M5bLgsrLJO4Y+fUjL0rmh/kGd7strY71bIwNg3HOZV5Hk8JLocbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760336789; c=relaxed/simple;
	bh=0KRoRtJwLzR0OmXQleHQP08qbMK0rxM94i2LMpKZsiw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=si0xL93QsGrPgT1DOy4tIxFB73n7uAxn9fikXUtbf2HggKAm2aWsLSibZGxN29/z7izR/X1azQ3VM5TGvgL+xSXESBgOcIru7T0SbUE2jCU3kmKmt5tpLIbLhqGFwHISBAka1p+E1aBfaJCOqZLub3h85KBkwI9w37OZWMmHXx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g26pJrzC; arc=fail smtp.client-ip=52.101.62.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g26pJrzC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJ0LxXTpzIvD4yPrekR64PN8HQGauP0vWcUjoPV77QPzPunpbmN4VOb0a93onSlIs2MQ8auQdP0KRynw0QeL59kT4p7Aun4UDeUmSPTOPoewnMcRhJ5ivSC/a6mrqV/DKA4h6BcuVn7dJBlKMtDiOv1AiwcfHZwwaUkJclspoQumf4JGGiYMW40yZbMSvx8bXgkUnpoMET1n2mjA41cduIbdIv+JmgmcrHC4x6Zh87wszlUHWVnh31Dy3cnGA1EEl7+14u19sUlNucA18QwsxP/021HKkc1o8Sb4CpScX+BobroDjtd+XmZb6Y7YHy+l50z9+52mMishnvwyxMFpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHqu7Cano9MeoQ1AlZ6V0yJAagiSJ/Aex4xoMRFSuD4=;
 b=shHpnwzslfrXg57cqtSM1gAgOPTnrubZ+3cP7NrQneJpsmcVVj01EIhMDCbHiV9Ej7KjRrTkXG3llQeUMWFMW56UAINZafVMkCZwxQ79ZsCwibkB3CCQF8cP40LWrJemum5bY7U2Lgp2HkoCL4JbdjTITU8mqNVVulsHqXt+eayUXOOEKGHBVau2IoC5rvdXOcg9rCEUi2vVAX50suvCDntQejIv/R/VgQHUMu5iNSoPRYYUaT7Myy/2XkbNRCljYlMtjioxDGZwsD2YqEiVUQWkEVLQtgwdbLNdYozG5owvIAQw4SFMP3pz495wkVp6ahnfQoOY/wYL+WsH/4q60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHqu7Cano9MeoQ1AlZ6V0yJAagiSJ/Aex4xoMRFSuD4=;
 b=g26pJrzCDECdgNNafYhBaNzOz6x3Zfa/rnxMZoVAoiDFGWakwb90FwgcnFQyBm87a7wkdk81qCZ9C+4wIJ3j6iJy2H30GLP7iHXWcnvff493FBvXR/mOKEHTmDPfqeN/Tx3EatiEOmqjS6JH3FJu7V9bdeelSwCIyU5buaRJwSP+7qpXTeOVRz6x30lkeIIU6FN6bOCCuZ0Adfua62LjOPB3oz2E5YF+MrmrpJgrlo+DKavk4ReTvI7Wur4Go+PGVeX3opZwtAfcPSX6SbEqfkmSVsBXHYXuqsWG0QdDgyfOmGLp3Nv/KUe9+3QpTRvfxzAQkytDR+eVPVTFgEXj6w==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS0PR12MB9725.namprd12.prod.outlook.com (2603:10b6:8:226::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 06:26:24 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:26:24 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	=?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ij@kernel.org>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
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
 AQHcDRMxc7D2+BxJGUa3jiZ0uZVtV7SqECZQgACnIACAALBIAIAAa1mAgAEnxVCAADbEAIAANhWAgAAbXICAAwZbwIAAFfmAgAAMFGCAABRiAIAAMbdwgABX7wCABWkngIAJRiFg
Date: Mon, 13 Oct 2025 06:26:24 +0000
Message-ID:
 <CY8PR12MB719595914FDED764977E6105DCEAA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com>
 <PAXPR07MB7984310A505E7EDDCA0CBFA6A31AA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719523226B3E785B8433C823DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
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
In-Reply-To:
 <PAXPR07MB798491A0140F43FFE17384D8A3E0A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS0PR12MB9725:EE_
x-ms-office365-filtering-correlation-id: 82d85c32-cddd-4b84-9676-08de0a216f0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?54ANyZDQXvUCWfbQfKMbtjzl+fEVGgUeqUaZxduHSjy2vcof+sFyNI+8fB?=
 =?iso-8859-1?Q?XuQx98kQawkWBO+ejKNdffIxXXmOWkc0kXjG7kHZwsDMeYQere8r3FuL2a?=
 =?iso-8859-1?Q?xt9NsHc/o9mNod926MO0HyzORcS8GrkRHekbbfgDogXv3et9gqoGcutQMY?=
 =?iso-8859-1?Q?1NeMFvIAWdW9Ut+h9svTY0UrJvlsouyJX4tL352Kp1JSEmGcjJ0d0YN4TD?=
 =?iso-8859-1?Q?XyzQRwoHE/W8yDa7W5MgkNJccPKmPZ1ofXxR2jHNyfr+VGcUCz+tQlSsx7?=
 =?iso-8859-1?Q?n8OplmTM+EEUlVAOwmSjpuN46LqG2ahIfHuhpH3Ql0DvYdq1b3LuGVhYPl?=
 =?iso-8859-1?Q?dnaTZM/EetY2XhaYqrv+GO5aLSPEBEzbRRvZACLRFCYmXuNmeqGjDj2HUC?=
 =?iso-8859-1?Q?SX1KPNCzAtPqjnTP0d6rnGmTs5stfC628rfKD5PXJPAs4szrxg8J5hX1JM?=
 =?iso-8859-1?Q?ADp+Pv51qYOpoCL+JesWNPplG5ATrRD2PuSFvvqruOTyNnJwMghSlmBB+D?=
 =?iso-8859-1?Q?D8BL0ojkDXNgeWQgdRDfOShghw4BPfLt4e9/UIuw3t0m6Cbwms98ZhJ/51?=
 =?iso-8859-1?Q?n9YfA9cK+qbk+guCupFBpVm1rLXc7Htv6tmKjg4VcJzLnPnJznTYRNsLFd?=
 =?iso-8859-1?Q?0tut/vjeWN7VXK2qR4zoDih0NCvfpumqjwr4qLrLFYgEJU4H4qfqevqhCM?=
 =?iso-8859-1?Q?vcrLDp+KBz28pLeU2zlarJVV5CdIUuTzoQGnO27iud/Pk2tUQ96abWFJ0H?=
 =?iso-8859-1?Q?25WPob9PiV7xBB6MMi9BoRvhNp5RlWG9rmUS+KzdqUgHU/GpsEiwsARp5q?=
 =?iso-8859-1?Q?+hUZh5heCP4EOJna1TZBtE9xp7m97tI+x3PmwXtiVmIfrJ2IcXxidsdyoX?=
 =?iso-8859-1?Q?OqxreWjJLPIDpwgOz4gsAk0Gl1pPkTuAtWI+4hCjpmXOz83WMf1mgX8/8K?=
 =?iso-8859-1?Q?XBVO17ekd7KpifuB/RJm+Wi1E8DxNn+X3c0BlbhwEc7vgb9ymnPwoCWOgG?=
 =?iso-8859-1?Q?R2J+Uc4bmO4nc62/UeFalUdrvWvSxBXNCnELbIoMTunKEL/YP+qNhvJ61N?=
 =?iso-8859-1?Q?Y2jxZoY1/JcZvnfp1soYeZhGTxRvIZl47C0cYhQ9tPai8AOYtjo8HqTTLZ?=
 =?iso-8859-1?Q?OVnLuR3qMbQBrVrut1gT7o33wPBd8FUoLQi8wBd7jO+zB5Xc38/IMFzvBd?=
 =?iso-8859-1?Q?R0Gxu6GSMNecefY34qzyNqg94Tcms8WYHuYJpWZBbccmVixudmtOzHGmox?=
 =?iso-8859-1?Q?s9W2YGaUFVT2mz9gdhOlArjDlCeFTtaW2hAeRBGkhs3vMvSVn+Pmw8VXzo?=
 =?iso-8859-1?Q?uTgvhvvK9g9RM7r6AHBOh5hiF+rxHpzZZQVX7BTsaTZit8k39oMO3Ucd66?=
 =?iso-8859-1?Q?eHJ0i1kgj+c36GsGAg1BW9Grndk1M5biJLpcb0q2D32epIPOI+YautzwaY?=
 =?iso-8859-1?Q?sUpjXrHGwiD5/LdHddUNhWhJrJ7tIkY632VAUEHOcO0ZdBb/g/g10SIFNV?=
 =?iso-8859-1?Q?YbTQ6piKZ7dxgbr3qPFLoXZU8J6n+jbncEJYsVBa/mrG7HaL1va9fNxhsY?=
 =?iso-8859-1?Q?KJ5ZazenTnsWDvUpFWH5DeYWSHH+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kpjJ3kwvirVum+Mz88vpGyBwSM0YgUBb0mxz/uGiqxwCD22WU89PXwtpsC?=
 =?iso-8859-1?Q?EyCJwE5KBsOvgsFGrqLFTPfGoUkifo6NZUxN2CCTgvYPy2ZbB+gKPzuEMj?=
 =?iso-8859-1?Q?hggt115eJbihy8hEzBuKwEQ0PEGzc1KSVnCKgRWAT1RPxCG/NBvfnLkg3n?=
 =?iso-8859-1?Q?4pBQ+Fe6envqXiJH0k0ZX3NwfdW6CSVQA6sCHXhcneBG4wRUO2w1UoaExj?=
 =?iso-8859-1?Q?xcvOizuuB/sg8Wx9KR8TIcJ//U4JhXPv/MoG3jp3/3aJU/OTT/VGVQ6AVJ?=
 =?iso-8859-1?Q?bQ3XKtKAqMPhFzGYX44xOUype4DzDMqDpfPYkid1tRn+m5gbQSnA3FhRIV?=
 =?iso-8859-1?Q?6NYEul2Luxf1W/8F8T70g89ZRcz8B0kBx3e2UpZKyTd1r8+C1x08zRCgqc?=
 =?iso-8859-1?Q?697KXnG3sqQeJ3RLYQpR6AhEUviuwo3+NjwkRJ/HTmFmEIFgXwP1EeFerN?=
 =?iso-8859-1?Q?qVPTjFhO9LDqxbzie72st5L5dFvzroRTLrD+cRSJwRLr4J0nJjl8aHkDDo?=
 =?iso-8859-1?Q?qtmeEnb4aRrDEIyfsfDHNudoMJS/8rEeJe605P60ynz6FBzvopcPaGDGVi?=
 =?iso-8859-1?Q?PHuLA4qlaVPp5GhTd9BLa3WIm4dh++isDhYbg9XflAoqM4ZZZJwrDBBxAD?=
 =?iso-8859-1?Q?fGSkCHSvYBMF4/QTEiQC2efy+uctrWF1w5uUdhI4hwd55gVrMFszMPJnhz?=
 =?iso-8859-1?Q?G4EDVdIuCrTHeO3Xz7GGeztaMoDOIaxjj8w6zpF9ZbXUhioO0R2LcFQm7e?=
 =?iso-8859-1?Q?iiIXKOot/FX04XN2aqpW7KBSPoSyNfJUGRJUINbAG/FGyhIBXZFhR0afn8?=
 =?iso-8859-1?Q?qw2Ko49+bBpkxHGe37s4oBeR7nViSSMeSu8xbS3TjeFR16I98gch1tjGRJ?=
 =?iso-8859-1?Q?zz/7+zxxkQM19juZwNhDBcIdFuVbGxmKUnryTwC8GoEhyeaIKS422O51gA?=
 =?iso-8859-1?Q?VnCwKkPWjxYAMyegbEju774iwiDq462YqCiWQnllmM4A+9E43c/l68D8d3?=
 =?iso-8859-1?Q?/PJY38brxkF6ikHeFkDZm8uKCtCyQtt6KU63ZVmrQk3sMQxEByzPrU0F4A?=
 =?iso-8859-1?Q?TvLGHvffx/5XN3ohe+Z2i98V5Pd9IDa6Mj9Y7qUlpnZgzBWX5tQ6McPNRu?=
 =?iso-8859-1?Q?m+0wAbDjAQzQa0r7KDv+gxWMuDNK2BGO2IphbbXGspMiGQUXAaiFcuLsmF?=
 =?iso-8859-1?Q?z6CIPquzAzpdD5nGfKT9WmzHTFPU7RCCtDJi0TwGnEHXQHwIlvuipeaH2G?=
 =?iso-8859-1?Q?Z0/Xea/jcReCZmuGRRGUez1HZMBnK1oqRkHLRBRFGrMkUO6uBaYQxoC04u?=
 =?iso-8859-1?Q?2RNTuV34MZHUlR2XNMfPpwIR8uHtQpoPwr4koYSAzety3FEUbIr6r7i2A6?=
 =?iso-8859-1?Q?lys67Or774m6MpnVTd+cjdUsMqvUmDRtr3fgRaDIoIdDRtFmAghV9RzxJM?=
 =?iso-8859-1?Q?+Yk6oLxqUT769GptMnLsyaBHq3G+dkj+0HjQIKSCWWFFNsgZeuUVpihEwT?=
 =?iso-8859-1?Q?hiVdbLrH3rQXDpkkwDx8KVP7wUBluO8AlJqo0U16qkPd4NvzBBxok+Q7d5?=
 =?iso-8859-1?Q?Ujg7FEaniLTJpLjW3SUpzjWqz0tE66dU9H9Ag9modc/3MI9qaqHszzzA9C?=
 =?iso-8859-1?Q?nshBU+IhNdoW5Q//sauy1W+MFBdP7CioI1VQid5UK/2+7YNet17ejxjsib?=
 =?iso-8859-1?Q?Xnt8ouiK0nuttSocx0E=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d85c32-cddd-4b84-9676-08de0a216f0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 06:26:24.6155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7TxgR0ZKas+fFVfcI1ZIy/LpYaqbPOLD+ksEykHwlmdjY30SzZqn0oUcgxMlvHnFzYfKlozyzFIq8wmeSuz4mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9725



> From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Sent: 07 October 2025 02:12 PM
>=20
> > -----Original Message-----
> > From: Ilpo J=E4rvinen <ij@kernel.org>
> > Sent: Saturday, October 4, 2025 12:05 AM
> > To: Parav Pandit <parav@nvidia.com>
> > Cc: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> > mvaralar@redhat.com; jasowang@redhat.com;
> xuanzhuo@linux.alibaba.com;
> > eperezma@redhat.com; ncardwell@google.com; Koen De Schepper (Nokia)
> > <koen.de_schepper@nokia-bell-labs.com>; g.white@cablelabs.com;
> > vidhi_goel@apple.com; ingemar.s.johansson@ericsson.com;
> > mirja.kuehlewind@ericsson.com
> > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
> >
> >
> > CAUTION: This is an external email. Please be very careful when clickin=
g
> links or opening attachments. See the URL nok.it/ext for additional
> information.
> >
> >
> >
> > On Fri, 3 Oct 2025, Parav Pandit wrote:
> >
> > > > > > > You described,
> > > > > > >
> > > > > > >     If NIC is completely unaware of RFC3168 ECN (doesn't supp=
ort
> > > > > > >     NETIF_F_TSO_ECN) or its TSO engine can be set to not touc=
h
> CWR flag
> > > > > > >     despite supporting also NETIF_F_TSO_ECN, TSO could be saf=
ely
> used
> > > > > > >     with AccECN on such NIC. This should be evaluated per NIC=
 basis
> > > > > > >     (not done in this patch series for any NICs).
> > > > > > >
> > > > > > > Based on above commit log, can we say that when existing
> > > > > > > GSO_ECN is not
> > > > > > negotiated, ACCECN can work as_is without the patch_2?
> > > > > > >
> > > > > > > [1] commit 023af5a72ab16 ("gso: AccECN support")
> > > > > >
> > > > > > Indeed, this patch description implies that NIC that currently
> > > > > > don't support TCP_ECN will naturally support ACCECN.
> > > > > > But an extra TSO_ACCECN flag will make this into an explicit
> > > > > > requirement, like our patch in the Linux.
> > > > > >
> > > > > If so, the 2nd patch should word saying, the device must not
> > > > > modify IP
> > > > congestion code point bits and TCP ACE bits.
> > > > > All packets in the segment offload must have same bits.
> > > > >
> > > > > Similarly on RX side for GRO, the device requirement to spell
> > > > > out that GRO
> > > > stream to break when two subsequent packets have different bits etc=
.
> > > > >
> > > > > If you can help to understand why RX side should set this and
> > > > > how one may
> > > > plan to use it, it makes sense to define the GUEST bit.
> > > > > Presently it does not look useful for rx side (guest bit).
> > > > >
> > > > > > Related to another email about existing driver, one solution
> > > > > > would be replace SKB_GSO_TCP_ECN with SKB_GSO_TCP_ACCECN,
> like
> > > > > > in 4e4f7cefb130af6aba6a393b2d13930b49390df9.
> > > > > > This can avoid CWR corruption somewhere after GRO, and we plan
> > > > > > to submit related patches (old driver, virtio-related) into
> > > > > > net-next after this is approved in virtio-spec.
> > > > >
> > > > > Commit 4e4f7cefb130a looks incorrect to me, or I must be missing
> > > > something.
> > > > > It looks incorrect to me is because:
> > > > > 1. SKB_GSO_TCP_ACCECN is set when cwr is set, regardless of tcp
> > > > > socket
> > > > following rfc3168 or accecn.
> > > > > I was hoping to set this flag only when its accecn.
> > > > >
> > > > > 2. Even though it is set, it is not read by anyone, so not sure
> > > > > why one would
> > > > set it.
> > > > >
> > > > > 3. It appears to me that it is TX side flag and rx GRO should
> > > > > not be setting it,
> > > > because there isn't rx side code to handle it yet.
> > > > > May be this is part of some multi series work?
> > > > >
> > > > > 4. The commit 4e4f7cefb130a claims to prevent field corruption.
> > > > > A corruption sounds like a bug. And if it is a bug, it the patch
> > > > > needs fixes tag,
> > > > but it does not have it.
> > > > > Probably no fixes tag, because no users, that is strange kernel c=
ode to
> me.
> > > >
> > > > Please let me elaborate more.
> > > >
> > > > Patch 023af5a72ab16 is in tcp_gso_segment(), so it disaggregates
> > > > packet on the TX side after TCP stack.
> > > > Before patch 023af5a72ab16, CWR flag from the 2nd packet will be
> > > > cleaned if TSO_ECN is set by RFC3168 ECN in tcp_output.c New
> > > > TSO_ACCECN will be set by AccECN protocol in tcp_output.c,
> > > > indicating that this packet does not want CWR flag cleaning from th=
e 2nd
> packet.
> > > >
> > > I understood the commit 023af5a72ab16 and commit looks good to me.
> > >
> > > > Patch 4e4f7cefb130a is in tcp_gro_receive(), so it aggregates
> > > > packets on the RX side before going to TCP stack.
> > > > And you can see before 4e4f7cefb130a patch, TSO_ECN flag will be
> > > > set if cwr is 1.
> > > SKB_GSO_TCP_ACCECN and SKB_GSO_TCP_ECN are mutually exclusive.
> > > So not sure how gro receive commit 4e4f7cefb130a replaces TCP_ECN wit=
h
> ACCECN.
> > >
> > > But regardless of that, you explain that rx side can set skb field
> > > based on how device has coalesced the packet, And tx side can use the
> same skb when using tcp/ip stack as router/forwarding unit.
> > > (instead of terminating/originating tcp connection from the socket).
> > >
> > > > This TSO_ECN flag implies that it's ok to segment this aggregated
> > > > packet and clean CWR from the 2nd packets by latter operations.
> > > > But this is NOT ok for AccECN protocl, new TSO_ACCECN flag
> > > > explicitly tells latter operations that it's NOT ok to clean CWR fr=
om the
> 2nd packets.
> > > >
> > > Right.
> > >
> > > > And the corruption in the commit message means the CWR flag cannot
> > > > keep the origianl value (i.e., been reset by latter operations).
> > >
> > > If the code reset the value when it should not, it means it was bug
> > > and needs fixes tag.
> >
> > It was intentional for RFC 3168 ECN offloading to the reset the value.
> > In the traditional sense it isn't "bug" because it was done intentional=
ly.
> > "When it should not" too, should considered with the background this
> offloading feature has (from era when AccECN didn't exists at all). But i=
t's fine
> to end up disagreeing on this detail about Fixes tag, in any case that co=
mmit is
> immutable now so this discussion is pretty moot :-).
> >
> > > Anyway, I don't want to diverge on the discussion.
> > >
> > > Seems like setting SKB_GSO_TCP_ECN seems fine even on rx skb too.
> >
> > SKB_GSO_TCP_ECN will not replicate the same TCP header flags in a
> forwarding scenario:
> >
> > Segment 1 CWR set
> > Segment 2 CWR set
> >
> > GRO rx and GSO tx with SKB_GSO_TCP_ECN, after forwarding outputs these
> > segments:
> >
> > Segment 1 CWR set
> > Segment 2 CWR cleared
> >
> > Thus, the ACE field in Segment 2 no longer contains the same value as i=
t was
> sent with.
> >
> > As rx side, generally, does not know if the sender is using AccECN or
> > RFC
> > 3168 (or some entirely different semantics for these flags as these TCP
> features are negotiated). I said "generally" because it would required
> connection tracking to know it which is expensive and has its own challen=
ges.
> >
> >
> > If you, on the other hand, imply that SKB_GSO_TCP_ECN could just become
> SKB_GSO_TCP_ACCECN just by declaring this corruption a "bug", that too is
> not possible.
> >
> > Or to be more precise, that would mean removing RFC 3168 ECN offloading
> support from the tx side (where it may have some, albeit IMO quite limite=
d
> [*], performance benefits). When we're TX'ing segment the kernel knows
> originate from RFC 3168 sender as indicated by SKB_GSO_TCP_ECN flag, it c=
an
> safely perform the RFC 3168 offloading without fear of corruption.
> >
> >
> > [*] RFC 3168 CWR is only sent once per RTT so those segments should not
> appear very frequently. What RFC 3168 offloading does is effectively allo=
w
> CWR to be send within the same super-skb with non-CWR segments as the
> RFC 3168 offloading with SKB_GSO_TCP_ECN ensures CWR is only sent out in
> one segment. Without SKB_GSO_TCP_ECN, the sender would have to send
> CWR segment separately (this potentially comes with a minor performance
> cost).
> >
> > > So you should just refine the wordings for patch 1 and 2 to match
> > > exactly what it means for virtio spec requiirements and description
> > > section.
>=20
> Thanks Ilpo for example above, and I just realized that the mail server m=
iss-
> resend an old email on Sunday, sorry for spamming.
> And I hope above explanations related to the CWR flag are clear.
>=20
> One more thing I would like to raise is about the ECN flag mentioned in
> current virtio-spec.
> As SKB_GSO_TCP_ECN is not related to IP.ECN in RX path even before
> 4e4f7cefb130a patch, and neither in TX path before 023af5a72ab16.

Can you please discuss with the netdev maintainer and clarify the usage of =
SKB_GSO_TCP_ECN.
i.e.
a. does SKB_GSO_TCP_ECN apply to RX side? From the name of "GSO" it does no=
t seem so, but three drivers hns3, mlx5, virtio-net are using these on the =
RX.
If this applies to the RX also, can we please send comment update patch to =
net-next to update, include/linux/skbuff.h

Something like:

--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -671,7 +671,9 @@ enum {
        /* This indicates the skb is from an untrusted source. */
        SKB_GSO_DODGY =3D 1 << 1,

-       /* This indicates the tcp segment has CWR set. */
+       /* This indicates the first tcp segment has CWR set in GSO or GRO s=
tream.
+        * and same first tcp/ip packet has IP ECN bit set accordingly.
+        */

Or if it does not have IP ECN link, above documentation to reflect accordin=
gly.
But I do not understand how CWR bit is set but IP.ECN not. Don't they go ha=
nd-in-hand (at least for TCP)?

> So, in below texts, I still only keep CWR flag but do updates based on
> feedback from Parav:
>=20
> 1. VIRTIO_NET_F_GUEST_ECN (9): Driver can receive TSO with the CWR flag
> set.
>    This CWR flag applies to only the first packet; this flag is cleared i=
n
>    subsequent packets in the offloaded segment.
>=20
Instead of writing "receive TSO", it should be written as driver can receiv=
e coalesced TCP segments...

> 2. VIRTIO_NET_F_HOST_ECN (13): Device can receive TSO with the CWR flag
> set.
>    This CWR flag applis to only the first packet; this flag is cleared in
>    subsequent packets in the offloaded segment.
>=20
> 3. If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
>    VIRTIO_NET_HDR_GSO_ECN bit in gso_type indicates that the CWR flag of
> the
>    TCP packet applied to only the first packet; this flag is cleared in
>    subsequent packets in the offloaded segment.
>=20
> 4. The driver SHOULD NOT send to the device TCP packets requiring
> segmentation
>    offload with the CWR flag set ONLY for to the first packet and cleared=
 in
>    subsequent packets, unless the VIRTIO_NET_F_HOST_ECN feature is
> negotiated,
>    in which case the driver MUST set VIRTIO_NET_HDR_GSO_ECN bit in
> gso_type.
>=20
> 5. The device SHOULD NOT coalesce TCP packets under single GSO stream if
> the
>    first packet has the CWR flag set and from the second onwards packets =
do
> not
>    have the CWR flag set, unless the VIRTIO_NET_F_GUEST_ECN feature is
> negotiated,
>    in which case the device MUST set VIRTIO_NET_HDR_GSO_ECN bit in
> gso_type.
