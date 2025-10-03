Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E59834BA50
	for <virtio-comment@lists.linux.dev>; Fri,  3 Oct 2025 13:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759499539; cv=fail; b=uk8Nb4o2evvuGzzmG2IJqBu+5INErUieEK3+zu92edTNoRoGr0zrq4Nai9kIEi3HVxrRjqzCkWeY1Y5dL9fxl40OrnNGGZxvBwuic6bqjjAeXZnaVUhpRmXcoVB30DUbtfVXC4djfj3XJcsXcnsBWYo9MP1fidhqw/0ZpFn4E8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759499539; c=relaxed/simple;
	bh=1Je+ukuvfdYhZrczIcuUwrEoBCeUIcwuntnqxAPwyyo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j6P/ERHKkA7hkNbgV51XmyNgWwOHEEjS7Hq84nJExBATWCbuyiEes28AglCv8CjvLas8KInY/IjT88E1zqMAxG/sWDMPzmZsx7Hn4Vf2VoWfRTF5itnYpJQse33PBnebevqsH8pNaSCClJlPzmPe6GDcgdZV2zlstTOT96rKo2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=aMhFQhRN; arc=fail smtp.client-ip=52.101.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="aMhFQhRN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbYsg1yjAEyjf3V8+QYmvFk/nZuCLNqEaiLbr/ya8+7PHBHss3ANx4hujRLa7YDsDZ96SCP6RejKO7+guckgX2EPVZ0InwvtKasnAyZXloV4kJRa+yDdYCmMs7ZfZ+oR7e4g/TDaT5yn+hIo3zej2Aa8ZH6k7z7sTLrDQg603rTRaveKdkn21z+cUWR5HLamQd95Fsvzob5hofdjhFotuVF0o1OJa9uyJ50V3r0uL1MWcBEej+Xb79SlRRYN9jGIf2kzEmyu7e973XkM179bw16lri6o5rgLbXkcS/inyz18ezZAci7rBH9dOwskEXeVeSkI8XIAC1p0rFN6vBTKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2im3k+IbB6fCiHrGklmQ1+J7vcs9ly2IOCqnirgGCBY=;
 b=UJ6rIU5K0gAPsLLzaKX7y3YRxObbgwpYkWXIq8F2FcAWCgcFXbhNPygYqaX8yS/FOS4zMNZ0LDjaS1ZhHq2TCLKyoTdobVmC5CeXN4d+kFFNfjvsQMbmqQLEjecFne4LYoMsuTVQicKJRpj/X7ZIAJGCw75TGMpBJGPLvwOPKLV861LqmXADAqurQu2HDrzcMnCdWmC94jSAJiRb2+so3oiLfUugduy4oPyjCrqZriF1Q0nqgEv47azba0vk5c3JKZyf6nqhxaaGw6Gyk2FL8BWP7SIPMgRiwlQW+Lgn1JjJfQgbs9j+/tK6GxCJjng2eZuv3Zs6/qFlesUlgKfqrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2im3k+IbB6fCiHrGklmQ1+J7vcs9ly2IOCqnirgGCBY=;
 b=aMhFQhRNJVoM9r4eXrT6x57Kvzf3028RVtKgMbfvqXX+d9fLb99matYzZEZhwPsAn99uUSjyLT0onw6hj61mZ9Hd19X9bBpyikpC0Gs2MOUT1HlDQ97vCKb914FRsvHbobyxQbJmeSg+lCS84yIQVLNCdiNHS4r11H5a3Ki+m4f6Mtso9sCrjeOuwgMH10lSkYkx+pFEn36S3SN04l/+mgzZQcfk4mH+H7gx6zGq9YLSCfQL+p8/XT4tFoIQqVG2wAo6hS8hFEQustnG5OEG2+amLs1KNM3btxs7m+rWZ7JcYEeclUsxtDmnJ8VU0W5jmEm3OHsDe+A3eMjHvir8nQ==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by PR3PR07MB6681.eurprd07.prod.outlook.com (2603:10a6:102:66::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 13:52:08 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 13:52:08 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index:
 AQHcDRMrginf6nv65kWiLWJ393AYBrSqEH4AgACeHQCAALjzAIAAY1+ggAExSICAADU0YIAANvAAgAAaczCAAwd3gIAAANzwgAAiYgCAAAGzgA==
Date: Fri, 3 Oct 2025 13:52:08 +0000
Message-ID:
 <PAXPR07MB79846714E156C1797667F6ABA3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
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
In-Reply-To:
 <CY8PR12MB719590ED886A60EE7867E7E6DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|PR3PR07MB6681:EE_
x-ms-office365-filtering-correlation-id: 7a252655-b657-44c2-c025-08de02840bad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wVjUtVItocBoj6LQ9RhXMI1+BVxgK3QzKTJ1HGOpR6YHOoc3wyFXVj+Jp4cs?=
 =?us-ascii?Q?9gv4+Wh+BNRcqZXqsCKvmgyogXv5cG/WKZXsXk+aUMJ3q0bpnwqfIEe8pv/n?=
 =?us-ascii?Q?tD6xhF4hPYrVXmRs7y8ZVpDBlqzd1jsFE5b9lph00AYPCw0/UZA1WENdjiTQ?=
 =?us-ascii?Q?BWVcYOtSg9b8L5zXIQQdCH9/qu5SO45Vldj0BiK70bHBEDRGG+AH/pkoukXU?=
 =?us-ascii?Q?yA+93uSlLYfkckXxDXO0ofFmjfqdl4dzYdZ2hCxQt3/FRwSMlskviV/3YRWB?=
 =?us-ascii?Q?8uKaAqYWKEmT94ek7LPbJjM/CHvyt4JxC5dAuW/QYsy3CbtuoLzzi5zn4eBS?=
 =?us-ascii?Q?meWvIZQcxGEjAf8i2k8l+zCgeQrTKxZXh12cJpGdufjbO8Cl9siCP9piIBa7?=
 =?us-ascii?Q?N172HF7y8PgER9Wn4Qax4cZq3nhe3pMqoXBLfWlijzTllN5o9GrGknIPNcZN?=
 =?us-ascii?Q?gY4+s5T2pCg2S4o74F8gCxWzfR1mfaMPrrhzMdoVgiFkmm821q6wk2UkFF7D?=
 =?us-ascii?Q?4BtAVkStPJuoHSVbL6Ah/MiDh37dOQmC8VMtcuMdF4EScnpEidU2eZ4K9P9b?=
 =?us-ascii?Q?L0bTaCjY2IQ3PT5CNitYnKS+R5GClhivIu8uIsZmgcS/FGg5II2Vv8MBcfvR?=
 =?us-ascii?Q?8Nv5KTJeAmes4y+PwzaiHKsKGhWncIIVZDI5tWDTL6l5vrMEDDrnwYpb7Pu6?=
 =?us-ascii?Q?cTVsdCzBfKKFPXc/13ZQ3mdvmIeSULFGexBc7WSJBQO829dDQNJew3iJz6Xn?=
 =?us-ascii?Q?5DXtTy0LAQ70USIRO0Irdt+drqFXzx7z5CI6l2EUpLMdatE++iIteFt8BPST?=
 =?us-ascii?Q?jlUjbwF1wBA/XWGfzk1XMXTnmKzYLN/3uaEvOUzhgQ67FAAqjVoy4tEoYeu1?=
 =?us-ascii?Q?HaOJU12TcMJHrEux0hLADgNJ1zxgvJ/DDYt/MNtEL4eQgkz0e2pBSJ5Wqt0t?=
 =?us-ascii?Q?+Rk5dUzwDuZ19mKeuexTDoY4Kw2rokXqzKB0zmhvjUFoHx1J1PjJGEYxs3zO?=
 =?us-ascii?Q?yPyc256rAg4N01c53SgKEMDqzY+mXjd4rdSjbv3AsaFtlpjLGm4DaNMRmmSU?=
 =?us-ascii?Q?MzhSMUfxxe51LTKGQpIHwEdvpeqjEUuo+Tl7BZEU6iG+8NEZOxIEixIVcLyu?=
 =?us-ascii?Q?RS+IeFXqkq7DGJFYe5q7vK3TgegghVtoaMkmxf39JYc7cLhlOeQfWEj9ajbB?=
 =?us-ascii?Q?fdU2tY+5+NQXDOlRQ3r1VIkWlfI1zKpUa5kNFBa3FSyoBwJ92SL3iHYSeUes?=
 =?us-ascii?Q?ifbwTh/MkPhYcnEEM2p0ZZ5xT4fIhMZG5p7kp1JdCb6gSXpXsMj9zALtD0ao?=
 =?us-ascii?Q?BDj7+BTgx9WZ+db2qRFeg4WtPt4qltHzfjGk1SMmvBabS4xRvmhV9JorIXpo?=
 =?us-ascii?Q?vAUwn8ADFZRVlmLfQtYVdfpT/2u6d8G4rw47qFEGhy7JYLeJI6Jm4UEY7D2h?=
 =?us-ascii?Q?v3evr8q1BFjuTQOTBfpgpfY3eRlqXjDwyDd+6ovQFH2dSECizKBKuwhqqIsx?=
 =?us-ascii?Q?Ao2o4qHDMTrNdxFdV1m2VnlNVtG9Tg8Ud5y8sthmPYO7oIATPdwiWeBiPQ?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uJwPnx/h5GrGofAIQGaGFsOdZL3XXxX92Vt5z2bKEa5jR/Tm8naFDYmFDFux?=
 =?us-ascii?Q?zLpB2ZjZnZOXDPaLRNV82y4cbIZaoH8BNOZrKRNenPylXZ357TsD37/XcvfU?=
 =?us-ascii?Q?vd0x2nzz3XDQG2MImylvBoBQWbVPW3upfl/XXbnnDfLB4Rx500jcIjL33ADA?=
 =?us-ascii?Q?sNktMVmLBYmk4pZPR6hwaByJDSF3JTfW7OGs8HkfORFDQ9I76EV+tvuElQqY?=
 =?us-ascii?Q?DqLYKneUXaiDpv5RZgZUbK3oMvH/6MQehh423LlmU4jFeQicZrLOHWFQeukE?=
 =?us-ascii?Q?6gWUH6D/n5ah0+kZAKGOZBs+MBsZ+2wKMzvEj/QUIGnoOujlOm1dKA74CElH?=
 =?us-ascii?Q?Q4w/WqGVg/YRyhkwrq8piyn+jNhtvf8IpefILf2yWi0+g3JbvifLCrhp26KI?=
 =?us-ascii?Q?4+x2vi2jVj0p4z3572KSJ1GIRPUougRIL+FVQ6CVQHTBkOTBevLampikgU1x?=
 =?us-ascii?Q?XEzvTdCxbstexssGvfK+csUiY8ZoAvIgsa1k0xQwxGJukq0byyWLn8M5N5zO?=
 =?us-ascii?Q?HbCT5XJd6vCpCeS2MIAaox9CarI0z/cxwgOc0RXf7MYRrOgl/E4i4A95S4H5?=
 =?us-ascii?Q?sFCDRR5eP2pJfEYiXlxeZIk87G9NcXGWkdtKsj1MqXdHryZ1CklULOYzJ9QZ?=
 =?us-ascii?Q?vcDTL8VLoJpekf3Ij3GkDe31seGFbkv8yo+FqSNKHKapKkjVRd1i7UiZ+IRL?=
 =?us-ascii?Q?OX0k3weNRCRl9VMHeDuKHSUf4DUPNVcoRi/4mZpfG4GgIO5HQABNHQww7gR5?=
 =?us-ascii?Q?S1g4QBgXQk2FEKibny2rg78Ti+FPw3p65zyLehzVtOp/orIOfczZvbgEU/OT?=
 =?us-ascii?Q?lvf5b8pq8ND7AiHRXuhnJ9xI1E37zHmjUUjJ22Vvb8DFFVQ0M1GbF3rAovmx?=
 =?us-ascii?Q?nmTPeaLocj/tgYvdarsCMIB54HOfq2bA1DbvQHkNwU8BWjwW/RDwbb2L6syj?=
 =?us-ascii?Q?Vf99S4NudlalWEaY7Xsiplu6JwJcpEg4kWvznMazuHnbV99aPbhFBZu7pvhw?=
 =?us-ascii?Q?mNHDn/8pNEtgh4XN6eilP5jPRZIM+qMhgl2WoJgxgR1ERhZium29uGJu7EOb?=
 =?us-ascii?Q?7xnq7W/BuvCcu38qGokN9JZ8MmEVspnKf6I6S/XzoWFAZcsLt4RadPseUHTy?=
 =?us-ascii?Q?dCvYqgmy+hXaXE/0IzYRlV+F2ajAhEFyOkyBSIqNCXJHcfx86CMVRzu1EEIr?=
 =?us-ascii?Q?/mukYVCT0CIwfzTn4ihsEEues2Bx5WeafA5v273rwKaNQ0c2MXwc5CGVe6kT?=
 =?us-ascii?Q?a9ev3nLYhF1MW7D76NkQ+fptB1xZHj/jHnqCLQ8I2EkWaba3HrRV7g1wF+3a?=
 =?us-ascii?Q?QL1jDWASUv2f0R97ifLchS88i0mPvA+3Om7cQV+lNAZyR7Uv1re1s4Wtupj6?=
 =?us-ascii?Q?l6MsdK0Wvx+q5G3uf7YqDl/ZtjhiFdgAzzeZveuu+kWTDtdSQSjaTWvd1CaQ?=
 =?us-ascii?Q?QXruk45476R2q6DhJjnRt3zgjvU36ltjOJE0nWOCnHlqORNvlMJPkAkxJyWr?=
 =?us-ascii?Q?5xFitbKOdCBrerPl8O88ZSssyC98Q+zuMpSgvUjL4LHPw5EaeoZOXtS77mjO?=
 =?us-ascii?Q?2fOwYZxODsuI31HENgm0KfCLYqktObdKtV5mPgWJtDXdw8uT2/8LG1PjqYQj?=
 =?us-ascii?Q?Xw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB7984.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a252655-b657-44c2-c025-08de02840bad
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 13:52:08.7896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C1jfdJIkj8kOPmMBAjoKok85DThCUr8ZEqfXX288C0tgd3yI7PlES1oZah+1Kx8i1UKEb7qw3zQEQk4InCi1kIfj/pcazGTE29yomCM4rKyzFynKmIeKq9gOMYwpTgwm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6681

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>=20
> Sent: Friday, October 3, 2025 2:47 PM
> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>; virtio-com=
ment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij=
@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepp=
er@nokia-bell-labs.com>; g.white@cablelabs.com; vidhi_goel@apple.com; ingem=
ar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > Sent: 03 October 2025 05:26 PM
> >
> > > -----Original Message-----
> > > From: Parav Pandit <parav@nvidia.com>
> > > Sent: Friday, October 3, 2025 12:41 PM
> > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;=20
> > > mvaralar@redhat.com; jasowang@redhat.com;
> > xuanzhuo@linux.alibaba.com;
> > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De=20
> > > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > descriptions
> > >
> > >
> > > CAUTION: This is an external email. Please be very careful when=20
> > > clicking
> > links or opening attachments. See the URL nok.it/ext for additional=20
> > information.
> > >
> > >
> > >
> > > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > > Sent: 01 October 2025 05:56 PM
> > > >
> > > > > -----Original Message-----
> > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > Sent: Wednesday, October 1, 2025 12:51 PM
> > > > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > > virtio-comment@lists.linux.dev; mst@redhat.com;=20
> > > > > cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com;
> > > > xuanzhuo@linux.alibaba.com;
> > > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen=20
> > > > > De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > > g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > > > descriptions
> > > > >
> > > > >
> > > > > CAUTION: This is an external email. Please be very careful when=20
> > > > > clicking links
> > > > or opening attachments. See the URL nok.it/ext for additional infor=
mation.
> > > > >
> > > > >
> > > > >
> > > > > > From: Chia-Yu Chang (Nokia)=20
> > > > > > <chia-yu.chang@nokia-bell-labs.com>
> > > > > > Sent: 01 October 2025 01:04 PM
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > > > Sent: Wednesday, October 1, 2025 6:24 AM
> > > > > > > To: Chia-Yu Chang (Nokia)=20
> > > > > > > <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > > virtio-comment@lists.linux.dev; mst@redhat.com;=20
> > > > > > > cohuck@redhat.com; mvaralar@redhat.com;
> > jasowang@redhat.com;
> > > > > > xuanzhuo@linux.alibaba.com;
> > > > > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com;
> > Koen
> > > > > > > De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > > g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > > > > > ingemar.s.johansson@ericsson.com;=20
> > > > > > > mirja.kuehlewind@ericsson.com
> > > > > > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > > > > > descriptions
> > > > > > >
> > > > > > >
> > > > > > > CAUTION: This is an external email. Please be very careful=20
> > > > > > > when clicking
> > > > > > links or opening attachments. See the URL nok.it/ext for=20
> > > > > > additional information.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > From: Chia-Yu Chang (Nokia)=20
> > > > > > > > <chia-yu.chang@nokia-bell-labs.com>
> > > > > > > >
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > > > > > Sent: Tuesday, September 30, 2025 6:15 AM
> > > > > > > > > To: Chia-Yu Chang (Nokia)=20
> > > > > > > > > <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > > > > virtio-comment@lists.linux.dev; mst@redhat.com;=20
> > > > > > > > > cohuck@redhat.com; mvaralar@redhat.com;
> > > > jasowang@redhat.com;
> > > > > > > > xuanzhuo@linux.alibaba.com;
> > > > > > > > > eperezma@redhat.com; ij@kernel.org;=20
> > > > > > > > > ncardwell@google.com; Koen De Schepper (Nokia)=20
> > > > > > > > > <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > > > > g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > > > > > > > ingemar.s.johansson@ericsson.com;=20
> > > > > > > > > mirja.kuehlewind@ericsson.com
> > > > > > > > > Subject: Re: [PATCH v10 1/2] virtio-net: Fix ECN feature=
=20
> > > > > > > > > descriptions
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > CAUTION: This is an external email. Please be very=20
> > > > > > > > > careful when clicking
> > > > > > > > links or opening attachments. See the URL nok.it/ext for=20
> > > > > > > > additional information.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > On 29-09-2025 11:14 pm, Chia-Yu Chang (Nokia) wrote:
> > > > > > > > > >> -----Original Message-----
> > > > > > > > > >> From: Parav Pandit <parav@nvidia.com>
> > > > > > > > > >> Sent: Monday, September 29, 2025 9:48 AM
> > > > > > > > > >> To: Chia-Yu Chang (Nokia)=20
> > > > > > > > > >> <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > > > > >> virtio-comment@lists.linux.dev; mst@redhat.com;=20
> > > > > > > > > >> cohuck@redhat.com; mvaralar@redhat.com;=20
> > > > > > > > > >> jasowang@redhat.com; xuanzhuo@linux.alibaba.com;=20
> > > > > > > > > >> eperezma@redhat.com;
> > > > > > ij@kernel.org;
> > > > > > > > > >> ncardwell@google.com; Koen De Schepper (Nokia)=20
> > > > > > > > > >> <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > > > > >> g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > > > > > > > >> ingemar.s.johansson@ericsson.com;
> > > > > > mirja.kuehlewind@ericsson.com
> > > > > > > > > >> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN=20
> > > > > > > > > >> feature descriptions
> > > > > > > > > >>
> > > > > > > > > >>
> > > > > > > > > >> CAUTION: This is an external email. Please be very=20
> > > > > > > > > >> careful when clicking
> > > > > > > > links or opening attachments. See the URL nok.it/ext for=20
> > > > > > > > additional information.
> > > > > > > > > >>
> > > > > > > > > >>
> > > > > > > > > >>
> > > > [...]
> > > > > Virtio spec requirements are clearly written.
> > > > > So just by referring to RFC 3168 is as blurry as today in context=
 of GSO.
> > > > >
> > > > > At best possibly it can be written as "device SHOULD do ECN and=20
> > > > > CWR in first
> > > > pkt.. and subsequent packets SHOULD have cleared".
> > > > >
> > > > > If that is not aligning, than better to not make it more blurry.
> > > > > ACCECN feature bit can be more crisply defined in that case.
> > > >
> > > > OK, then could you let us know if we make below changes in the=20
> > > > next version, are they clear enough for virtio spec?
> > > >
> > > >
> > > > 1. VIRTIO_NET_F_GUEST_ECN (9): Driver can receive TSO with the CWR=
=20
> > > > flag set. This CWR flag is only applied to the first packet, and=20
> > > > the CWR flag of subsequent packets should be cleared.
> > > >
> > > > 2. VIRTIO_NET_F_HOST_ECN (13): Device can receive TSO with the CWR=
=20
> > > > flag set. This CWR flag is only applied to the first packet, and=20
> > > > the CWR flag of subsequent packets should be cleared.
> > > >
> > > > 3. If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature, the=
=20
> > > > VIRTIO_NET_HDR_GSO_ECN bit in gso_type indicates that the CWR flag=
=20
> > > > of the TCP packet applied only to the first packet and is cleared=20
> > > > in subsequent packets.
> > > >
> > > > 4. The driver SHOULD NOT send to the device TCP packets requiring=20
> > > > segmentation offload with the CWR flag set ONLY for to the first=20
> > > > packet and cleared in subsequent packets, unless the=20
> > > > VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the=20
> > > > driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in gso_type.
> > > >
> > > > 5. The device SHOULD NOT send to the driver TCP packets requiring=20
> > > > segmentation offload with the CWR flag set ONLY for to the first=20
> > > > packet and cleared in subsequent packets, unless the=20
> > > > VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the=20
> > > > driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in gso_type.
> > > >
> > >
> > > Also, while it is good to document existing behaviour of the spec,=20
> > > devices
> > and drivers, I believe that ACCECN need not have to wait for the=20
> > documentation of existing GSO_ECN.
> > >
> > > However, I am bit puzzled with the Linux kernel commit [1] of yours=20
> > > that
> > hints that ACCECN may not need any special handling.
> > >
> > > You described,
> > >
> > >     If NIC is completely unaware of RFC3168 ECN (doesn't support
> > >     NETIF_F_TSO_ECN) or its TSO engine can be set to not touch CWR fl=
ag
> > >     despite supporting also NETIF_F_TSO_ECN, TSO could be safely used
> > >     with AccECN on such NIC. This should be evaluated per NIC basis
> > >     (not done in this patch series for any NICs).
> > >
> > > Based on above commit log, can we say that when existing GSO_ECN is=20
> > > not
> > negotiated, ACCECN can work as_is without the patch_2?
> > >
> > > [1] commit 023af5a72ab16 ("gso: AccECN support")
> >
> > Indeed, this patch description implies that NIC that currently don't=20
> > support TCP_ECN will naturally support ACCECN.
> > But an extra TSO_ACCECN flag will make this into an explicit=20
> > requirement, like our patch in the Linux.
> >
> If so, the 2nd patch should word saying, the device must not modify IP co=
ngestion code point bits and TCP ACE bits.
> All packets in the segment offload must have same bits.
>=20
> Similarly on RX side for GRO, the device requirement to spell out that GR=
O stream to break when two subsequent packets have different bits etc.
>=20
> If you can help to understand why RX side should set this and how one may=
 plan to use it, it makes sense to define the GUEST bit.
> Presently it does not look useful for rx side (guest bit).
>=20
> > Related to another email about existing driver, one solution would be=20
> > replace SKB_GSO_TCP_ECN with SKB_GSO_TCP_ACCECN, like in=20
> > 4e4f7cefb130af6aba6a393b2d13930b49390df9.
> > This can avoid CWR corruption somewhere after GRO, and we plan to=20
> > submit related patches (old driver, virtio-related) into net-next=20
> > after this is approved in virtio-spec.
>=20
> Commit 4e4f7cefb130a looks incorrect to me, or I must be missing somethin=
g.
> It looks incorrect to me is because:
> 1. SKB_GSO_TCP_ACCECN is set when cwr is set, regardless of tcp socket fo=
llowing rfc3168 or accecn.
> I was hoping to set this flag only when its accecn.
>=20
> 2. Even though it is set, it is not read by anyone, so not sure why one w=
ould set it.
>=20
> 3. It appears to me that it is TX side flag and rx GRO should not be sett=
ing it, because there isn't rx side code to handle it yet.
> May be this is part of some multi series work?
>=20
> 4. The commit 4e4f7cefb130a claims to prevent field corruption.
> A corruption sounds like a bug. And if it is a bug, it the patch needs fi=
xes tag, but it does not have it.
> Probably no fixes tag, because no users, that is strange kernel code to m=
e.

Please let me elaborate more.

Patch 023af5a72ab16 is in tcp_gso_segment(), so it disaggregates packet on =
the TX side after TCP stack.
Before patch 023af5a72ab16, CWR flag from the 2nd packet will be cleaned if=
 TSO_ECN is set by RFC3168 ECN in tcp_output.c
New TSO_ACCECN will be set by AccECN protocol in tcp_output.c, indicating t=
hat this packet does not want CWR flag cleaning from the 2nd packet.

Patch 4e4f7cefb130a is in tcp_gro_receive(), so it aggregates packets on th=
e RX side before going to TCP stack.
And you can see before 4e4f7cefb130a patch, TSO_ECN flag will be set if cwr=
 is 1.
This TSO_ECN flag implies that it's ok to segment this aggregated packet an=
d clean CWR from the 2nd packets by latter operations.
But this is NOT ok for AccECN protocl, new TSO_ACCECN flag explicitly tells=
 latter operations that it's NOT ok to clean CWR from the 2nd packets.

And the corruption in the commit message means the CWR flag cannot keep the=
 origianl value (i.e., been reset by latter operations).
