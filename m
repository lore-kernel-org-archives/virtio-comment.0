Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DD8A95E
	for <virtio-comment@lists.linux.dev>; Fri,  3 Oct 2025 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759485553; cv=fail; b=aB8ivIiHLXEMIlAoy8LW6FUWgH/xsnMRmNU9EeW8r+mZGTEooTu+5uGxARbeJ7ycFCuDKs1jAIlYIO4wSlQ9zcZicHpIt8TXPRR9d/y2nNkiopLpzQ9Gc7nTeKbQ4GaTy3gCVVw2U201tySxTgtpCqooqnOc4g0/6gHUA5H6jlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759485553; c=relaxed/simple;
	bh=ZP0wJ1/hvN1DYOyPHXJx35sECLVMna9LYsH3m78X6W0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vg1QA7aSlKkguku2aTg0v5HPPrfcegoUgkWzulwlPQ1w5M+FfI6Yifo5cHQWLZmAVUNdSgJV1RZrUMVP8z3mPC/judlUXikP38hWaztAdUbBNYIexoTRO85EINrOZOvhjhJz+sLIR0cNmB0LazzNQlAHJpU+WfeJaZj9l55/I54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VycXTCGg; arc=fail smtp.client-ip=52.101.46.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VycXTCGg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iP5cmSUW49OJKKtFyMFXO/PS5XpG99Q28RqbVoi7PhJEKv+9r/7ZINDtuLeojlm3aiHwgGWt3UgaxmxbJdp43+OUE8Vr1+UCmUcvK5L31JwJQMVTbRTMKul7+KSdVrYaNl60RMGGevLUYVodKUiROPOZjZpVPLUTnz29K+15HrgodO/T47iMtG0eiHOp7XR5yavWPXVWQfR4SMAnH7ApyIeqpJd4IemcRcGrbVg73sOSMGTF+8OuPYOg6FUIa8MVm7rj6hCeFAgVDiZa1dOsyZp+ECOFBVLmUoBcNb60gF8kXnuTrA4eZ1hbmhhFa/y8lFqVcF4sTMA0OfHYJ41yvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZP0wJ1/hvN1DYOyPHXJx35sECLVMna9LYsH3m78X6W0=;
 b=fo7+Y//mwv5inKsq40+5y8ag+QYRL/CZGicrsqVhDH/Ss3Cs0ZLfhK30s/T5aDqlL6c3vKF8yf78kchR9AvvNK46L5LghnoWU8lvFh3RUsbGbpXNGNPZ98tXFE1chRaN4V/LPhMGthT+nFFLr1LN5fEQ151FPRXZKSWC5kT+Xmn7ml668fhUSCg+l0T7avdgKB7AnJiul4V0FdXm3MKDwXV2HOMWj7mR6kRgiqJxChantfHEVhwso1UCX6R1b3EuSi/rW5XYgmDDo+ww8qjNcWwvjELfS85nuAqrvT0IN0OaEPDtGGG0RjsBCotl2rYA0MXrE/ahtU/tuX9OCrOdUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP0wJ1/hvN1DYOyPHXJx35sECLVMna9LYsH3m78X6W0=;
 b=VycXTCGgq59Rkkq7v/raZYM5bwO4aVPt4bI/33iclNlfxwoYCXrnZo2wE/NbgV9WYbwmOGb2olrlz0vHBA9v+FVajRRDfGxiwOafoixV+ipRRQgK1/DVuMEtgUg/0nGlDjm3+lmibvg1fdpajmeRiCJb8gxIqoE3i5eNndK+iX30ughfp7DaUrzej5rLOntlGyXLvZk5IY+1d3NzI4Wx25aAdXp0KtOWsGTxmzy2bnGlN2gStbRUY0N++zRwKJhnOHObqf3VTAxQ0CRmYaMRMWXr7z5VkdwjDCaoK0rDKuXzZ1BKtwMbUvb805W1kLZr/PC/pWJhddgppgXoZDZTyw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA0PR12MB8375.namprd12.prod.outlook.com (2603:10b6:208:3dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 09:59:03 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9160.015; Fri, 3 Oct 2025
 09:59:03 +0000
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
 AQHcDRMxc7D2+BxJGUa3jiZ0uZVtV7SqECZQgACnIACAALBIAIAAa1mAgAEnxVCAADbEAIAANhWAgAAbXICAAvgn8A==
Date: Fri, 3 Oct 2025 09:59:03 +0000
Message-ID:
 <CY8PR12MB7195A64945CE730867BF897ADCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
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
In-Reply-To:
 <PAXPR07MB79845B9580C4D17590E8C2DEA3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA0PR12MB8375:EE_
x-ms-office365-filtering-correlation-id: 50c737e1-2a4e-445c-b4f7-08de02637b91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|7416014|366016|38070700021|921020|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6FsShjBG26O5bDKaPWAQHwTjDZkmJGptF1dLFHwBCoWpWfzyKNPW/yOQLLay?=
 =?us-ascii?Q?W5mvIkvYXmXeJmQzXlGahyLzOauCnKUxP6nqsZwqEtov0q5FLOn7dsP3NWR/?=
 =?us-ascii?Q?TsnPGVtnaq1GuR0Q6hMYZxeEO/wv7exj+o0SZtFpeCyX8gfekHYJXPC1ZDyp?=
 =?us-ascii?Q?1hbgicIeJKC1k9UrNnDvqdSjL15jnimB187lsPiIVeKnK8Xh5Z//jbQf/gxi?=
 =?us-ascii?Q?WN9K4wy84JOAubFHjt9xGVgGkBfUWnlPlHVK7JjKgRH7/y3YMVCcSZJaJSuu?=
 =?us-ascii?Q?ILAnWJH5m4JjK3hTlOi3Nf+0AiERFPaWHKpswKdcwZUvvxaWbf/njCtOMZZk?=
 =?us-ascii?Q?2D72jVgWP+IS82QAvxY1AOud6Cl6Uiqnt/5Ho7VRGXBLpIVFCvZqyQxnV7TY?=
 =?us-ascii?Q?2KPs+que4OgyVsCZ9I3AsjC4q5yOvFd2+W68CSx8Bdx+JPo3H35YLCvzuTlj?=
 =?us-ascii?Q?PmmedzXfbCpzq+xwNAAd5wNWyXewJpfVFXArKWjyFZVExsC2T0sLsuCOf27l?=
 =?us-ascii?Q?9w1FRV6ienmSMwuFl+kqu/51VVc3+aQVhnKnKQAq8SlKbwYBQhOqypEK+qJ0?=
 =?us-ascii?Q?gNlWg8uv+2RlQYOhHXxKVvBgIEPpvrpRz8LY0jVlMRlKXFnnxCF4U44Dv/C1?=
 =?us-ascii?Q?si5YvCr/90tAzj0yHGF8nxUMZsL9y4CUUT0R/5Z8K5kLAVYIAHXuupjxhtRU?=
 =?us-ascii?Q?xQaDfdZCd5jAPenJyp9wu+wxRnXBfGy2gceIyMGp1F9KlGGo+h/y8zdL4Iu8?=
 =?us-ascii?Q?QSYZPMGihK86lvPDjHI2L3bBngib50jZ/lf07Tz8WW8xig3qaweNtiXHT9LD?=
 =?us-ascii?Q?G7jpudEjLuYVdobQR4c4ucFvRQpyMzT2Gy0zkS0XyrORrsZ39v+rBjYqv11X?=
 =?us-ascii?Q?YW8MYfGqFtipEn4qhMf5aMFuQWHE0bcW3TdY2fiOrqhb/WB+Gj958Bf2zdy2?=
 =?us-ascii?Q?ysorZ3bJEhrb5jJh7EgK9PNJrZRHTYlz6IDJ90lXhUzRjhVpsRh8FxE2NoDt?=
 =?us-ascii?Q?P+I6l5kIS+1Q6AZ9wliKdZiWmJDEr0RXfy//tJMRPkq65cgO9yhi//K2YLM4?=
 =?us-ascii?Q?s06diU0dt0OLobbPnxBC4DKCO7xWqEssEU0QJWIlkK8FkgAJ1k+gfYBvSlla?=
 =?us-ascii?Q?vQr5nU2S7rZePNSzJQHoJX7xlpgkd3xL6p5UkniWuBrv9frWBSh6w1+tPm6+?=
 =?us-ascii?Q?k7l/U9olWwafJhxCPGM6EpecVOp8h6rCVA9S3Ya0xWlP83eBTon9xc62Vl6H?=
 =?us-ascii?Q?vEz4O3s86+ZBGRwJpSATkG0BgMjLPYtX4u6x+IAUGx26agww4RwzIIhYJOVY?=
 =?us-ascii?Q?jdG4BjsINHGsFTR6zgKVv9zeKk2aej0V77H3zKWEjUHn4HlTKgk+1FxtujAl?=
 =?us-ascii?Q?YOBIYfDx8lDI1j5lbGXlIH838M6iYQ44AUs53bVJsVykX1lVvWy0Cit22qKm?=
 =?us-ascii?Q?xeYLXPoHcDb1g8Q9DcGRNr9WN4SOjSRBTtDyn1P9Xo2clCNl9Hvg0ExoKpFW?=
 =?us-ascii?Q?wzG/8bbLcX7ci1U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(7416014)(366016)(38070700021)(921020)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Iu2sYSmXb9gs+1QNJNPlIRHMG4IfPAzwsJcu+CRUIf2gIP+MVnoDRcy1JB/T?=
 =?us-ascii?Q?N9/zFbrs1xGlfu4uwLS15NgHuvIVOKEFlQjpRHAskG0PMl+15LH0eobYTQJg?=
 =?us-ascii?Q?uLhbSi83yPK4fsqNdgV4jc+lQZtk0SdSOac2QAJkTXC0WZisAQ3jCaMp/kTw?=
 =?us-ascii?Q?+sKg9Nf34AUh95VKi91CsLzC+/VGWcoXrxKPg3w2+xrktun5pqyKuYItAaEQ?=
 =?us-ascii?Q?nYMo/Ft6lt16AnWPCrV59GKIPaVBsBlAOCLJKVS13vcnMB4tDWup5lRRomdH?=
 =?us-ascii?Q?YjPPNyHxqWFyoGpcmON+gkRAWqdRRvzUK4psrejvz2OSrz5DAa1S/OZHg+4i?=
 =?us-ascii?Q?X6AryRWsAojlGPqlkagjsgCArzNtTRInP2ZI1YK+DhSBT0oMqnXDNdn8toXu?=
 =?us-ascii?Q?2ZBnEUtrlrTq+sjiMfj6FkLscnKlIrLuhtjs7Nq6m5RE5lroNR5lDe5Gehs2?=
 =?us-ascii?Q?SetWnBJUGQ9HELwUMFWSILPaFXx3c4OMRZ0dN5trjYy4ayEftn2fHOSPGRau?=
 =?us-ascii?Q?URsuRuN/Iqr4k3yhSIsTlyHIlvl63DR9QyCVj9KZDpmkQv9bipZbNEcqaAgh?=
 =?us-ascii?Q?ETK79zeb1odTaVJtYX3yAR7qwmeMT7n1om7eDIaEDXJC+q+iiCRaclL7EGR9?=
 =?us-ascii?Q?JHaV5anjQtJNzcHr6s7IKcu1l4ePIvl5/4kBtcGTwxS2BD4B/7W1YXZaGj8n?=
 =?us-ascii?Q?uKsNHhsaFY/DSBvwLpJPEl814jp2exu0UNLUw61i3VORAFI8do6BYUgRzHSB?=
 =?us-ascii?Q?qq95TI0vPAyYeaMMaJ25A2PIJbhlb9M1sMF60zolb8935jme/VX1TTAQl27q?=
 =?us-ascii?Q?r4K3BZa9srxyIZl3Rs5bGinxrKadeg7Fq2LEYLdjlhscDl6r5y9aYMlmbFyW?=
 =?us-ascii?Q?qwFLROwgvWkzHQ6lxOaT22pd3bHcn1lo4kPFjpj709GA0ZuRtuvJoRIMKHOi?=
 =?us-ascii?Q?k5Rd83sP1/cIviywQuNDUTn74gpG5ibSSIeXX5jAaMnDhXw3zuzyuEa3mlxY?=
 =?us-ascii?Q?jfeQ4osEjPoGfmJvI6SGmXxpG4H9YnrzOtKqvcsxhMsOXIlWXWzLXMwYGXsq?=
 =?us-ascii?Q?oLLDJ0+KygzaQaEIsJgohgVqKY7Q8rhGke59gaegYwLT8N6y7bSManvL7zHf?=
 =?us-ascii?Q?zVHQ2PHcBzfQc83nbLh6u/S8bVc1iW356VoPczFbrDzZkotdDdYq/LZiBhhD?=
 =?us-ascii?Q?5fZhB0O0Pjs6hh2ex/INLK85RzwELY/YNX3ECUOIHMa/Ox82N95A3l9KYEPt?=
 =?us-ascii?Q?a9zourHCYci69wYB25JhCMXnq0oz7nmfZm+4EGubQS5ZAoo775F4qmlHBimX?=
 =?us-ascii?Q?KBHJulwILu/tLnqaPvjwOzQqO7NVFxhcAtMnSPSQJgUK97Cm0en5/Cw6lJ6O?=
 =?us-ascii?Q?jsdqLXuLb4wNRLcLJCKGzXkhXT2njkpPZxNPk7EXnpok1FkYY5U/Nm7X8Tq1?=
 =?us-ascii?Q?AyemBNQcvcoOMtMtWznBU93mknlD86UKj45+sjQVzOb9J+zYJOhuZLIu1HWB?=
 =?us-ascii?Q?ciE01SvQN5WHUc/dlhnA4LMIe/btiFDV1M5Z67k/zXYKw5ul0Y7JUtMr6dnI?=
 =?us-ascii?Q?SioFg6tmjByINOLT2ZeSNb7tdP21pe131ti3nZX+dgkroA1jNN/cjuZ6UfPs?=
 =?us-ascii?Q?w7idr9cxZ93nHu5cgUx9HvE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c737e1-2a4e-445c-b4f7-08de02637b91
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 09:59:03.1053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cnM7AuozRlvqu9UcdNrwaS40U3ITB5aas8Zi0aJLpzp26T8EFIZOQCmZ/v/zNVWp2Bqk5SHBkEo2CYvVkaO/2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8375



> From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Sent: 01 October 2025 05:56 PM
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Wednesday, October 1, 2025 12:51 PM
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
> > > Sent: 01 October 2025 01:04 PM
> > >
> > > > -----Original Message-----
> > > > From: Parav Pandit <parav@nvidia.com>
> > > > Sent: Wednesday, October 1, 2025 6:24 AM
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
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > > Sent: Tuesday, September 30, 2025 6:15 AM
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
> > > > > > Subject: Re: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > > > descriptions
> > > > > >
> > > > > >
> > > > > > CAUTION: This is an external email. Please be very careful
> > > > > > when clicking
> > > > > links or opening attachments. See the URL nok.it/ext for
> > > > > additional information.
> > > > > >
> > > > > >
> > > > > >
> > > > > > On 29-09-2025 11:14 pm, Chia-Yu Chang (Nokia) wrote:
> > > > > > >> -----Original Message-----
> > > > > > >> From: Parav Pandit <parav@nvidia.com>
> > > > > > >> Sent: Monday, September 29, 2025 9:48 AM
> > > > > > >> To: Chia-Yu Chang (Nokia)
> > > > > > >> <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > >> virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > > > >> cohuck@redhat.com; mvaralar@redhat.com;
> > > > > > >> jasowang@redhat.com; xuanzhuo@linux.alibaba.com;
> > > > > > >> eperezma@redhat.com;
> > > ij@kernel.org;
> > > > > > >> ncardwell@google.com; Koen De Schepper (Nokia)
> > > > > > >> <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > >> g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > > > >> ingemar.s.johansson@ericsson.com;
> > > mirja.kuehlewind@ericsson.com
> > > > > > >> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > > > >> descriptions
> > > > > > >>
> > > > > > >>
> > > > > > >> CAUTION: This is an external email. Please be very careful
> > > > > > >> when clicking
> > > > > links or opening attachments. See the URL nok.it/ext for
> > > > > additional information.
> > > > > > >>
> > > > > > >>
> > > > > > >>
> [...]
> > Virtio spec requirements are clearly written.
> > So just by referring to RFC 3168 is as blurry as today in context of GS=
O.
> >
> > At best possibly it can be written as "device SHOULD do ECN and CWR in
> first pkt.. and subsequent packets SHOULD have cleared".
> >
> > If that is not aligning, than better to not make it more blurry.
> > ACCECN feature bit can be more crisply defined in that case.
>=20
> OK, then could you let us know if we make below changes in the next versi=
on,
> are they clear enough for virtio spec?
>=20
>=20
> 1. VIRTIO_NET_F_GUEST_ECN (9): Driver can receive TSO with the CWR flag
> set. This CWR flag is only applied to the first packet, and the CWR flag =
of
> subsequent packets should be cleared.
>=20
I am not confident of #1.
The Linux document clearly documents usage of VIRTIO_NET_F_HOST_ECN for the=
 TSO (and not for the GRO).
The two hw drivers who have set SKB_GSO_TCP_ECN seems like a bug to me.
Looking at the internal specification of mlx5 hw device and code [1] and ze=
ro usage of this flag on the rx skb, it appears a bug to me.

I am going check about bug [1] in few days with more experts internally and=
 likely provide the driver fix to remove it.

[1] https://elixir.bootlin.com/linux/v6.17/source/drivers/net/ethernet/mell=
anox/mlx5/core/en_rx.c#L1299


> 2. VIRTIO_NET_F_HOST_ECN (13): Device can receive TSO with the CWR flag
> set. This CWR flag is only applied to the first packet, and the CWR flag =
of
> subsequent packets should be cleared.
>
I believe it applies to the two bits of the IP header too (in addition to C=
WR).

In the non-requirement section avoid using the key word 'should'.
In other words above line to be reworded something like:

Device can receive TSO with the CWR flag set. This TCP CWR flag and IP head=
er ECN codepoints applies to only the first packet; these flags are cleared=
 in subsequent packets in the offloaded segment..

=20
> 3. If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature, the
> VIRTIO_NET_HDR_GSO_ECN bit in gso_type indicates that the CWR flag of the
> TCP packet applied only to the first packet and is cleared in subsequent
> packets.
>
Similar wording to include IP header as well.
=20
> 4. The driver SHOULD NOT send to the device TCP packets requiring
> segmentation offload with the CWR flag set ONLY for to the first packet a=
nd
> cleared in subsequent packets, unless the VIRTIO_NET_F_HOST_ECN feature i=
s
> negotiated, in which case the driver MUST set the
> VIRTIO_NET_HDR_GSO_ECN bit in gso_type.
>=20

> 5. The device SHOULD NOT send to the driver TCP packets requiring
> segmentation offload with the CWR flag set ONLY for to the first packet a=
nd
> cleared in subsequent packets, unless the VIRTIO_NET_F_GUEST_ECN feature
> is negotiated, in which case the driver MUST set the
> VIRTIO_NET_HDR_GSO_ECN bit in gso_type.
>=20
s/driver MUST set the/device MUST set/

the wording around "segmentation offload' for receive is confusing in the c=
urrent form.

Better wording would be,

The device SHOULD coalesce TCP packets under single GSO stream if following=
 conditions are met.
1. first TCP packet has ECN bits set
2. second onwards packets do not have ECN bits set etc

