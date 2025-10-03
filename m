Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011026.outbound.protection.outlook.com [40.93.194.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BCF2D8791
	for <virtio-comment@lists.linux.dev>; Fri,  3 Oct 2025 17:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759512885; cv=fail; b=tSROrfjIV/wR1zeVrB3Ds9RP7z6A7bSDWZIznyV/KTR4rp5UU9RIxWvswe+AtZE/fY/BXHdtFkxiC8qXLyS8TSozV1cfyZRXv2Q7yRHc4AUQokLap01Kfrf5zODr0683wJzr1KU3fNT4i3OVezpxt0GLvOO9t4PtnDBrK0wwms8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759512885; c=relaxed/simple;
	bh=XiVXufMpZ6dOgiRsq2P/znwciWa4MA/Or0SW07P4StU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jwu9C9r2N4Yym3/MvFtj+hHDopRvtbjAhrVT65nF5a6m33kPaF111zImxSeYaLStHPKsz4Y7jw/GB+k3po6FbNFe0yiqLUH6cF8Rt8GWQy7Mm8GAL4Vve1lTYBjInmMeztjV58ugoJGnuf2idVc+O2nfA3Ape5up6sSoacNzvXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bTUrAbMt; arc=fail smtp.client-ip=40.93.194.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bTUrAbMt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOFi8sSI+tSJhD8XiGGpnuCW69iYSkgpNu/qLR4N0S1oRLnhINgezC+r3w7UBEQiaqhM+TEKwOz88XawVsSHg3buGJpePeMcUwKJUvi5KOb+5eZNqzpM4ky/eQVmrQhiO/8jawLJlKy0mp+NQu7w7xgiIMB8W/fZvnveRy4UWAQ9Xo5MA6mNgWxQC6OdmbiEZ4zts/XeOjnCMiECEdn6nnLItA48lPTRUEU6MYa57f4/BDbP15VWOk+X3V5eNKGLf8Ag43qfnDbXLgnu/gHKzD2InjleESeEv0h/TEDysl/qJK5IGK2XqR7O1h3xO+LkN05q5/Ss29bqDFNLkI6W7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2xCQjS5sxZSNCp8lRuA0ZOeIpWZEo4Yvz6zpkD9ULw=;
 b=WraL8Vqi8UKHGu4vRoEDqF9Fuomp0DmCYTT1WI8SdfHBcztDu9cukgOOCJFAE8swAAYIS3eEQl1dd9YeLjDkuQPUa9ZZhfEfbBQpyEVKvzDHjNCDE0nKI00lU3BTZmX3f0PWFjY9ZLHIhZXXgBn8LOr+r8rQWR4twvGFgQROG+gBzg6cqwq3No41WHR5igVf4/7oV6ECKbIERpmrrzWgLhynHP2yKrZkvVUneJ1FNj/UExazn3vx3dr+ndYBdBw8ArEaako7p7+iAJJp58SAI9uXs6+4qHVEKY5W0gclbiXVSpa4e7DLH3MnlbVRKXVrJUwu86HLvibeWDGzPHRQmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2xCQjS5sxZSNCp8lRuA0ZOeIpWZEo4Yvz6zpkD9ULw=;
 b=bTUrAbMtI+e8kQvBn8niVdQVJCKFmd6I7hYEcDxF5z5sIecidQMXu4KjM5oX43BXB6Otjqct9u94DnHmS1cYQyX8vdOdIpjVFxI3k3yQ7ioMCr5nGl21XJfr7Kj6LKtiRx44ZZ4HRj+xEjdXkuNsYYoSQMW2+zpZU1MJUdx//soP7A4L7Ws7W+0nxr75Ax581pRj3tbj48aPhyhbEqi0egn9M7Et5q+T7+VcloKriW9mfmbDzkF8k4iUUbwpN/0oYk+eaNqMvy+kCTOV7nIQoRuizyuCNitBhUX7Th7LNgsoC1M8U2HPV0LSRToRuTQhByMgcxAtivDyNeodwOs/yQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH1PPFA0A5C3BCA.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 3 Oct
 2025 17:34:35 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9160.015; Fri, 3 Oct 2025
 17:34:33 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index:
 AQHcDRMxc7D2+BxJGUa3jiZ0uZVtV7SqECZQgACnIACAALBIAIAAa1mAgAEnxVCAADbEAIAANhWAgAAbXICAAwZbwIAAFfmAgAAMFGCAABRiAIAAMbdw
Date: Fri, 3 Oct 2025 17:34:33 +0000
Message-ID:
 <CY8PR12MB7195DF4B90E52B22D33964E0DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79843798615E61FA134A5428A31BA@PAXPR07MB7984.eurprd07.prod.outlook.com>
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
In-Reply-To:
 <PAXPR07MB79846714E156C1797667F6ABA3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH1PPFA0A5C3BCA:EE_
x-ms-office365-filtering-correlation-id: 26718677-b931-4cc4-8247-08de02a31ddc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|10070799003|376014|366016|13003099007|921020|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?awDyfGEW4h6eiQlSXG6hc2aXXo80lFlpH60zIjT8QCM/W1DyEB7CZmMD4KU3?=
 =?us-ascii?Q?e4A6fkZdr/FjIc0j3//WH1pCe7bbwBACm8W67FsB2LDsGjS1zki7mkQAuVSl?=
 =?us-ascii?Q?qTBwgTB9uW4WtEVzze9MJFZdGl19gh4uvWbNZ1YvmB4bEZjLYp7v0FzbTCIJ?=
 =?us-ascii?Q?hi9ARD2tb8hzTe8O6/XOsppeUjkKZ+p4gR41nrozXFVoL0CsRWbHIOy4IP2o?=
 =?us-ascii?Q?fzDRZ4Oisq6Flr1oX6Lwthkl1+x9fegwErjnCzdVmNE+mqPjWB+cz87p/GWH?=
 =?us-ascii?Q?K0y8UuxTGpo0+/zmC/TdYGIZKf6O53JENpEPxPFMVoKj7I48hAoiu4Poexc6?=
 =?us-ascii?Q?gelfnIjnfSRjE0QE51tir6Sz3VIaGkXDYLWBSIWGLkiBdr2IehT9SCHn7yWK?=
 =?us-ascii?Q?/WkpLduVLTEx88xspRH3bmzD+h8ot6RIFVHSseMrQc2BOUMKzKPgZIOD/p9p?=
 =?us-ascii?Q?QOWmI4Zwa3jQxZDAfaD/6ay223msk9olSHEJkrDFHuv3JqI0iEJN7Q+tpLqz?=
 =?us-ascii?Q?tewJvTYNGyD8B82b8KwfQj5TlRl7YACfx7aybUDPawzTJRbIVKoO4yjaw2D5?=
 =?us-ascii?Q?8Hq9b6p4I5zpV368uURhwYlruhMMgl72GsSjfjmmpeOQTcJibSm+6g4EtjOl?=
 =?us-ascii?Q?3LqCRExJ8lO7OUFzvrTfNfd8iVFIrgEzN4OR5Uzvt68K1x2X+NnBDGRx6X39?=
 =?us-ascii?Q?PFLxtdt7HYH3jUs2e7zOhStJZArhEsZ5qaVnKrxHLxZiXcx7m2hQ27sy1zAd?=
 =?us-ascii?Q?MmAvJVH8hCQ5+vgprS4GovCkY8IBPv/wSbFPOlmJSOXbg9yQqhCxshHhPu8U?=
 =?us-ascii?Q?Sxa3VeW2LFHyI6FlnrzbCWhr6BWEFF70Df3cyI89Ojbq6uoG071pbtLPtOw9?=
 =?us-ascii?Q?6QuyrZW7RunuK0y+jnopKwGbvcc7pGiNdkx8WRoD0fDXDCxc6PKQExBYI9wC?=
 =?us-ascii?Q?19Agk7SLGRQqOx9mxtPeDteTx9D8Pyu11AyWGqAiU5qxgWf5EeiPaoblVYA+?=
 =?us-ascii?Q?B4QHTcXouj8/hCkGMmOmhvHs6AxtE/143jAGwaX4N5fKL+kHloGw2PMvU05c?=
 =?us-ascii?Q?nXPiCK5lsHHtK9qEdDfbh+84lOuPR+Y43BtUJcVid0J0EIgN+yJsk2L2EtbB?=
 =?us-ascii?Q?dEGmkNRAeukKbI0R3PNuABA8YnbIrkNRv/FEwLh4Y+5VQi/sjob3papJsfkB?=
 =?us-ascii?Q?pM+59BFiGv+y0GIf+jC/1ti9EavYYTQI/X3rOmra+n058k3FSy5+4k7teBCt?=
 =?us-ascii?Q?brweiFUWmpse4OFUtP0T4/NxSHl/iNuuvJrotiQRLr/a9Z+oDgBwdKniQP+K?=
 =?us-ascii?Q?05sPrvDPDvjABTNnhLm2nAcsbbvBl4+yv2wqPjGarqCFaEuaHPmcNkPECctW?=
 =?us-ascii?Q?/VWpgKffArKd/To6mlBRATuQgSlZzLj9jHWih5JVIxpGi6s1NjKEIDxeYxzi?=
 =?us-ascii?Q?slgjOl6Yrehw3e1zLiCMlF35Gi22shRkQeg+RHBTex+wD74jOSe5BhLQbU/D?=
 =?us-ascii?Q?7qR5/xwWEXXgyQngHbu+xD/ihxwEyHsLZHuvdNnu7SE+ryOzSgyPbvnZNQ?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(10070799003)(376014)(366016)(13003099007)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?niz3gBvzbzCeJKSnc22AzM/SHw/VoGVLKKAlOkUCbs2A9hGxTgPyAKfrp1eZ?=
 =?us-ascii?Q?UekxHTclE4mixXc0phEWcYawNJkkcE1PkYlEndyQF3+fRb+DJ5y0iexonMze?=
 =?us-ascii?Q?+bhBZ7cvCTA5rvL+BKCn3OD/uv9ASlRDxQu6c3KSpQQ9EH6AaBHmuxt98p1a?=
 =?us-ascii?Q?u+o3DluREvG/p2MrQhSnyJtZaFYZLXLxDivfp77xMWm3drkmjgYwFC0xheQT?=
 =?us-ascii?Q?7ApUz5cRkqbvFRZ2jsg9hfTkOZqFF3CsSGWu9E38MTAAq1cS3HWKJ6ol50WH?=
 =?us-ascii?Q?pw6nYpOhIwq7fkM992TvD3zXaXhyZ6+YomU4/LXSmM4ys1E7hZUH9S82WeuX?=
 =?us-ascii?Q?9PpS2ECTsTffIATr8o/yFeYnbdXqP1bKdMD74OvzG3oAzekHo2w1s+jyC0EQ?=
 =?us-ascii?Q?aJj2cYGDrRBQpm/cUfJx6iQKNh/8Rl45x8vkyGys5DrSjsP37/8WXs90cxL4?=
 =?us-ascii?Q?SLhAY4dGrf46fhsRUgLSVeZAGP0/6R4gboW2bBzPiVKJJbm7/XVwvN7nvK/0?=
 =?us-ascii?Q?8JoqMoYes00G3anM0psRo4tjgzBMcm+nO4I8TlryyQQ26ve3+9X5u62J5/Rz?=
 =?us-ascii?Q?csEtlcf2w0R1q9KT8qiPGm0xeJdSfZ6Ueonm7KshaJpzUHwSihtKrFsb3hYS?=
 =?us-ascii?Q?7JLdQlW1szQCPmmzyr+amQR90yoB1rHfbvZUrTMIuhtPGSj6r34fTirccO+l?=
 =?us-ascii?Q?ABgpWih2DRlQBm+63KS6ANY2kyqW3DAGxFKpRAXUSbYpy5boD8+RhC9XApCr?=
 =?us-ascii?Q?dacK01v3gsctVgQQ4rwKl+024ABDU4BJ57hMxF7PpecSQbgDcysl/YnQewz7?=
 =?us-ascii?Q?o0F/wY0b44Osrwrn9xIaQpgOB0MWywfNynPKC9sA1HO3d/ahu24KAxpvmPQT?=
 =?us-ascii?Q?pHCrtIQ3VlHHPyRPve6c5odzWI3W9AYP+jHEpd8IBYvakoLiwl9NmKvb0nOs?=
 =?us-ascii?Q?cBhujAsGoUeQ7QNEg8b36BXNWREBRDj06AEB89quJFCXnLZlMvcfJCAfvZtJ?=
 =?us-ascii?Q?3Ld8Ju96jSkVOzhoLWS142tNhvncMPmUfzyKdYoJl8Zhzxh8f9Mg1SbFj2a0?=
 =?us-ascii?Q?6h/H2bRntKSMPJV4GMTXpg0uYq4EgrZ/lIzM8Q5Bs70p2Sy7wxCZNul3scZ8?=
 =?us-ascii?Q?ayuQuHw+TLzQkj4EfJD3nKJFCyjmkT3wCvO/ncBNGojROBGAl3CJQuwgOrL+?=
 =?us-ascii?Q?oIbkfttaXMV2VYtOIMPh0Xq1cuNIMWvWqFvLt37A2APaCbT3v1kM31c4KY1l?=
 =?us-ascii?Q?D/l1kFZrJJHa7rS8YiLVDjA292fFi8wRJ4fB4s4no4I5SGx+i2R3p8r5GqAj?=
 =?us-ascii?Q?/yZ8y7cr0aSc/ejIlABm4NL5lQo5wxmZOI1S8ePGd1HnRxOQ8vPiP/f5837Y?=
 =?us-ascii?Q?Lc2L0n5ci1heOY7hWP9XoSznLpdlEoMkBKmRSrLbIwogKTHhCUz8LBYRHbVZ?=
 =?us-ascii?Q?e0l4cwUJmVfzfmtjtC/ZBPfNLfCzJIVzF20Nux0iYKg5wW9ySc8IKhpdGKPc?=
 =?us-ascii?Q?GucUcy6JRFrEMjrvan/ZE3F5baN+e4/Funh9VSXVulE+m+BtnNh11V5d3HLA?=
 =?us-ascii?Q?mo/wNPN2fgFP05Mrg/5Mz4vEdg76AtyIZue5hAhtuA1IlHJnlYcVtMhnaSgp?=
 =?us-ascii?Q?FDLCO0fJezjYLFT7FKPSYxc=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26718677-b931-4cc4-8247-08de02a31ddc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 17:34:33.6584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YSEgr4dVK+4VDno1QjbNwitbMfTw4pjfitHd9dlToMs5pNBYXNUqQ8BTx8HmDjnyvJktShZpmbwPYV901QsiEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFA0A5C3BCA



> From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Sent: 03 October 2025 07:22 PM
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Friday, October 3, 2025 2:47 PM
> > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> > mvaralar@redhat.com; jasowang@redhat.com;
> xuanzhuo@linux.alibaba.com;
> > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De
> > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > g.white@cablelabs.com; vidhi_goel@apple.com;
> > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
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
> > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > Sent: 03 October 2025 05:26 PM
> > >
> > > > -----Original Message-----
> > > > From: Parav Pandit <parav@nvidia.com>
> > > > Sent: Friday, October 3, 2025 12:41 PM
> > > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> > > > mvaralar@redhat.com; jasowang@redhat.com;
> > > xuanzhuo@linux.alibaba.com;
> > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De
> > > > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
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
> > > > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > > > Sent: 01 October 2025 05:56 PM
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > > Sent: Wednesday, October 1, 2025 12:51 PM
> > > > > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > > > cohuck@redhat.com; mvaralar@redhat.com;
> jasowang@redhat.com;
> > > > > xuanzhuo@linux.alibaba.com;
> > > > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com;
> Koen
> > > > > > De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > > > ingemar.s.johansson@ericsson.com;
> > > > > > mirja.kuehlewind@ericsson.com
> > > > > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > > > descriptions
> > > > > >
> > > > > >
> > > > > > CAUTION: This is an external email. Please be very careful
> > > > > > when clicking links
> > > > > or opening attachments. See the URL nok.it/ext for additional
> information.
> > > > > >
> > > > > >
> > > > > >
> > > > > > > From: Chia-Yu Chang (Nokia)
> > > > > > > <chia-yu.chang@nokia-bell-labs.com>
> > > > > > > Sent: 01 October 2025 01:04 PM
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > > > > Sent: Wednesday, October 1, 2025 6:24 AM
> > > > > > > > To: Chia-Yu Chang (Nokia)
> > > > > > > > <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > > > virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > > > > > cohuck@redhat.com; mvaralar@redhat.com;
> > > jasowang@redhat.com;
> > > > > > > xuanzhuo@linux.alibaba.com;
> > > > > > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com;
> > > Koen
> > > > > > > > De Schepper (Nokia)
> > > > > > > > <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > > > g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > > > > > ingemar.s.johansson@ericsson.com;
> > > > > > > > mirja.kuehlewind@ericsson.com
> > > > > > > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > > > > > descriptions
> > > > > > > >
> > > > > > > >
> > > > > > > > CAUTION: This is an external email. Please be very careful
> > > > > > > > when clicking
> > > > > > > links or opening attachments. See the URL nok.it/ext for
> > > > > > > additional information.
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > > From: Chia-Yu Chang (Nokia)
> > > > > > > > > <chia-yu.chang@nokia-bell-labs.com>
> > > > > > > > >
> > > > > > > > > > -----Original Message-----
> > > > > > > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > > > > > > Sent: Tuesday, September 30, 2025 6:15 AM
> > > > > > > > > > To: Chia-Yu Chang (Nokia)
> > > > > > > > > > <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > > > > > virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > > > > > > > cohuck@redhat.com; mvaralar@redhat.com;
> > > > > jasowang@redhat.com;
> > > > > > > > > xuanzhuo@linux.alibaba.com;
> > > > > > > > > > eperezma@redhat.com; ij@kernel.org;
> > > > > > > > > > ncardwell@google.com; Koen De Schepper (Nokia)
> > > > > > > > > > <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > > > > > g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > > > > > > > ingemar.s.johansson@ericsson.com;
> > > > > > > > > > mirja.kuehlewind@ericsson.com
> > > > > > > > > > Subject: Re: [PATCH v10 1/2] virtio-net: Fix ECN
> > > > > > > > > > feature descriptions
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > CAUTION: This is an external email. Please be very
> > > > > > > > > > careful when clicking
> > > > > > > > > links or opening attachments. See the URL nok.it/ext for
> > > > > > > > > additional information.
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > On 29-09-2025 11:14 pm, Chia-Yu Chang (Nokia) wrote:
> > > > > > > > > > >> -----Original Message-----
> > > > > > > > > > >> From: Parav Pandit <parav@nvidia.com>
> > > > > > > > > > >> Sent: Monday, September 29, 2025 9:48 AM
> > > > > > > > > > >> To: Chia-Yu Chang (Nokia)
> > > > > > > > > > >> <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > > > > > >> virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > > > > > > > >> cohuck@redhat.com; mvaralar@redhat.com;
> > > > > > > > > > >> jasowang@redhat.com; xuanzhuo@linux.alibaba.com;
> > > > > > > > > > >> eperezma@redhat.com;
> > > > > > > ij@kernel.org;
> > > > > > > > > > >> ncardwell@google.com; Koen De Schepper (Nokia)
> > > > > > > > > > >> <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > > > > > >> g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > > > > > > > >> ingemar.s.johansson@ericsson.com;
> > > > > > > mirja.kuehlewind@ericsson.com
> > > > > > > > > > >> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN
> > > > > > > > > > >> feature descriptions
> > > > > > > > > > >>
> > > > > > > > > > >>
> > > > > > > > > > >> CAUTION: This is an external email. Please be very
> > > > > > > > > > >> careful when clicking
> > > > > > > > > links or opening attachments. See the URL nok.it/ext for
> > > > > > > > > additional information.
> > > > > > > > > > >>
> > > > > > > > > > >>
> > > > > > > > > > >>
> > > > > [...]
> > > > > > Virtio spec requirements are clearly written.
> > > > > > So just by referring to RFC 3168 is as blurry as today in conte=
xt of
> GSO.
> > > > > >
> > > > > > At best possibly it can be written as "device SHOULD do ECN
> > > > > > and CWR in first
> > > > > pkt.. and subsequent packets SHOULD have cleared".
> > > > > >
> > > > > > If that is not aligning, than better to not make it more blurry=
.
> > > > > > ACCECN feature bit can be more crisply defined in that case.
> > > > >
> > > > > OK, then could you let us know if we make below changes in the
> > > > > next version, are they clear enough for virtio spec?
> > > > >
> > > > >
> > > > > 1. VIRTIO_NET_F_GUEST_ECN (9): Driver can receive TSO with the
> > > > > CWR flag set. This CWR flag is only applied to the first packet,
> > > > > and the CWR flag of subsequent packets should be cleared.
> > > > >
> > > > > 2. VIRTIO_NET_F_HOST_ECN (13): Device can receive TSO with the
> > > > > CWR flag set. This CWR flag is only applied to the first packet,
> > > > > and the CWR flag of subsequent packets should be cleared.
> > > > >
> > > > > 3. If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
> > > > > the VIRTIO_NET_HDR_GSO_ECN bit in gso_type indicates that the
> > > > > CWR flag of the TCP packet applied only to the first packet and
> > > > > is cleared in subsequent packets.
> > > > >
> > > > > 4. The driver SHOULD NOT send to the device TCP packets
> > > > > requiring segmentation offload with the CWR flag set ONLY for to
> > > > > the first packet and cleared in subsequent packets, unless the
> > > > > VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
> > > > > driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in gso_type.
> > > > >
> > > > > 5. The device SHOULD NOT send to the driver TCP packets
> > > > > requiring segmentation offload with the CWR flag set ONLY for to
> > > > > the first packet and cleared in subsequent packets, unless the
> > > > > VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
> > > > > driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in gso_type.
> > > > >
> > > >
> > > > Also, while it is good to document existing behaviour of the spec,
> > > > devices
> > > and drivers, I believe that ACCECN need not have to wait for the
> > > documentation of existing GSO_ECN.
> > > >
> > > > However, I am bit puzzled with the Linux kernel commit [1] of
> > > > yours that
> > > hints that ACCECN may not need any special handling.
> > > >
> > > > You described,
> > > >
> > > >     If NIC is completely unaware of RFC3168 ECN (doesn't support
> > > >     NETIF_F_TSO_ECN) or its TSO engine can be set to not touch CWR =
flag
> > > >     despite supporting also NETIF_F_TSO_ECN, TSO could be safely us=
ed
> > > >     with AccECN on such NIC. This should be evaluated per NIC basis
> > > >     (not done in this patch series for any NICs).
> > > >
> > > > Based on above commit log, can we say that when existing GSO_ECN
> > > > is not
> > > negotiated, ACCECN can work as_is without the patch_2?
> > > >
> > > > [1] commit 023af5a72ab16 ("gso: AccECN support")
> > >
> > > Indeed, this patch description implies that NIC that currently don't
> > > support TCP_ECN will naturally support ACCECN.
> > > But an extra TSO_ACCECN flag will make this into an explicit
> > > requirement, like our patch in the Linux.
> > >
> > If so, the 2nd patch should word saying, the device must not modify IP
> congestion code point bits and TCP ACE bits.
> > All packets in the segment offload must have same bits.
> >
> > Similarly on RX side for GRO, the device requirement to spell out that =
GRO
> stream to break when two subsequent packets have different bits etc.
> >
> > If you can help to understand why RX side should set this and how one m=
ay
> plan to use it, it makes sense to define the GUEST bit.
> > Presently it does not look useful for rx side (guest bit).
> >
> > > Related to another email about existing driver, one solution would
> > > be replace SKB_GSO_TCP_ECN with SKB_GSO_TCP_ACCECN, like in
> > > 4e4f7cefb130af6aba6a393b2d13930b49390df9.
> > > This can avoid CWR corruption somewhere after GRO, and we plan to
> > > submit related patches (old driver, virtio-related) into net-next
> > > after this is approved in virtio-spec.
> >
> > Commit 4e4f7cefb130a looks incorrect to me, or I must be missing
> something.
> > It looks incorrect to me is because:
> > 1. SKB_GSO_TCP_ACCECN is set when cwr is set, regardless of tcp socket
> following rfc3168 or accecn.
> > I was hoping to set this flag only when its accecn.
> >
> > 2. Even though it is set, it is not read by anyone, so not sure why one=
 would
> set it.
> >
> > 3. It appears to me that it is TX side flag and rx GRO should not be se=
tting it,
> because there isn't rx side code to handle it yet.
> > May be this is part of some multi series work?
> >
> > 4. The commit 4e4f7cefb130a claims to prevent field corruption.
> > A corruption sounds like a bug. And if it is a bug, it the patch needs =
fixes tag,
> but it does not have it.
> > Probably no fixes tag, because no users, that is strange kernel code to=
 me.
>=20
> Please let me elaborate more.
>=20
> Patch 023af5a72ab16 is in tcp_gso_segment(), so it disaggregates packet o=
n
> the TX side after TCP stack.
> Before patch 023af5a72ab16, CWR flag from the 2nd packet will be cleaned =
if
> TSO_ECN is set by RFC3168 ECN in tcp_output.c New TSO_ACCECN will be set
> by AccECN protocol in tcp_output.c, indicating that this packet does not =
want
> CWR flag cleaning from the 2nd packet.
>=20
I understood the commit 023af5a72ab16 and commit looks good to me.

> Patch 4e4f7cefb130a is in tcp_gro_receive(), so it aggregates packets on =
the RX
> side before going to TCP stack.
> And you can see before 4e4f7cefb130a patch, TSO_ECN flag will be set if c=
wr
> is 1.
SKB_GSO_TCP_ACCECN and SKB_GSO_TCP_ECN are mutually exclusive.
So not sure how gro receive commit 4e4f7cefb130a replaces TCP_ECN with ACCE=
CN.

But regardless of that, you explain that rx side can set skb field based on=
 how device has coalesced the packet,
And tx side can use the same skb when using tcp/ip stack as router/forwardi=
ng unit.
(instead of terminating/originating tcp connection from the socket).

> This TSO_ECN flag implies that it's ok to segment this aggregated packet =
and
> clean CWR from the 2nd packets by latter operations.
> But this is NOT ok for AccECN protocl, new TSO_ACCECN flag explicitly tel=
ls
> latter operations that it's NOT ok to clean CWR from the 2nd packets.
>
Right.
=20
> And the corruption in the commit message means the CWR flag cannot keep
> the origianl value (i.e., been reset by latter operations).=09

If the code reset the value when it should not, it means it was bug and nee=
ds fixes tag.
Anyway, I don't want to diverge on the discussion.

Seems like setting SKB_GSO_TCP_ECN seems fine even on rx skb too.
So you should just refine the wordings for patch 1 and 2 to match exactly w=
hat it means for virtio spec requiirements and description section.
