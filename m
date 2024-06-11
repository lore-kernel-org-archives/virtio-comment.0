Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD647A7C
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718127650; cv=fail; b=NfOmJTPp0MkkH1BsMc+JwHajtq5fQ4Lf9tua7HGcYgbcHE0ajXMtEy5zBl07UgAjJcAOdFMLo5gYO2uu+NjSxLvUdEviaqAlZTKIVg0mauz9tPON8D44YGrubd3Rkx6f1c3qgc24YLYG1fMsosNRvlMiH1elm9GA/OMX4XNaj5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718127650; c=relaxed/simple;
	bh=fY2EsCXHK3/6Y2oEa4qxOmE3VXHMPVL5fUYGjy/xaz8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BREfxJSeP0GLkqPIYpha2PAciRyMjquzHI6zrkZEhZhwFDdnj5E4nKKljy96zqRlPu55PslCiOXzOVTDqISAM1QW0xoxBeFHFFVrPdY4oWUO9jEWyLFGphHG/NrCRz8MtePBg2J3tH9o/xkE8MdIelSBlGx5CzVhNAzJSnlhkHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E4r4DWjS; arc=fail smtp.client-ip=40.107.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E4r4DWjS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMMG/yfkAFXj+Dpw6WI4AgbbRUv4DcldNf3ro/iYPfzK+RFtzjt0stwO6fGvopANzmPgPgyRfFPo+pNESRbVM/8WQ5ecadxjHrOoDRxr/dEjpS9XHcfurIogSlUPboThXtVgEhNyJ949rx4Ip/yxY7HNnMDiasZzMsAWBmY3Y05aWxHLdHB143JIi/mzfR84UYt07znjpEyBRafih7srjfP8H7PVpbM1YvoPYRjNDxuSRCL4P4fTHb91w9dZyYZ9YiswvKmOEyd9InWCNdhHKujySO0rPh4+jblv59LEh+YZ9470eG/KOdoo1q4cFZsRbaa4hHjsGo1dsH9EG1ck5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYMcXdjor8uU2YXoCUBpQ06jf/6jQp/eMmg5WGqClb8=;
 b=MDt1HmqB6OBeZD/uarq21bbCUuox8Opn9R1Fd6y9dh+g8V1qbYfY5jyRoB3PTA42Ksei9TaCS1Nm3LF22nr38Fjp/BQarl5hLwlUNC9cKsn32xBCD3W+PJ8XFYIarHTbn2xPAyYU1rfZATwrtRcx0ZsQjjXlnflfpQVUUdUvG1pMvQng4QjEmJLYK/z9daDI4U1q2lkxqH6gy5RM5leBRbXr6y0HxUXIw7JhcDkkRpYoEmHjGPtaLpWwqG47jFT7PbI2YdVqY6vKsTkUd69nHB8Cq9s4UKUkEPnzAyndc5VLDPoANRzT0Z/Rst1N4hr+BMLrkyJSqxTImLfFRm6Pag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYMcXdjor8uU2YXoCUBpQ06jf/6jQp/eMmg5WGqClb8=;
 b=E4r4DWjSKCM6xA6ZKvVs8t3XzAnE9Qvh6cLOMwF7d6FXQ/VNcMxc44gzju+PUsOW5UceMteiNFesyegmp8nonpN9IuZ0MsYqyhXyMB9IOq3gwHG0EmeaZoJ96duGbeHoa2VVEbRMYXf+lPb40kX3G2PTTqsjJWXEsiGzo7OVKyQKgeVtlhHTQZkI9KP8WSeQZUy/ooHmxTjb1lxD/gdQSAcMkG9JfgBm53ntdVi+VMlDeqWDBE/o8wMBUK/OEGLQyWCtf/rYoxXjVNQTpyKanIfMReFlceu9RE8Hsumeh0dLM42qlMFqkYJ/ZG8RHa/17csJ+yYgMXIwo43Phq9law==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 17:40:45 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 17:40:45 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: Vincent Guittot <vincent.guittot@linaro.org>,
	=?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>, Manos
 Pitsidianakis <manos.pitsidianakis@linaro.org>, "Michael S. Tsirkin"
	<mst@redhat.com>
Subject: RE: [PATCH V5] virtio-transport: Clarify requirements
Thread-Topic: [PATCH V5] virtio-transport: Clarify requirements
Thread-Index: AQHau8GUIND+r1IV+UyIhrsUeJlUDrHCENgwgACfxICAACQfoA==
Date: Tue, 11 Jun 2024 17:40:45 +0000
Message-ID:
 <PH0PR12MB5481B721659E596A77AAB756DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
 <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87plsnjy6k.fsf@redhat.com>
In-Reply-To: <87plsnjy6k.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4466:EE_
x-ms-office365-filtering-correlation-id: 35918cca-7ec8-4d5b-a6fa-08dc8a3d9faa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gA/OltGuHF5XHL+OAEBCDFipkx8Wte1YOKZ0n1TP5s5Jw8708IXOi1WnX4?=
 =?iso-8859-1?Q?KA2K+lsj3ZIwNMOv5NH+DZWMVJgHJwjsMe3fvFaxyTWdRr5WgYC1lt8wGg?=
 =?iso-8859-1?Q?X3jKq2fH4PI3Xza50uNo7RMPZuNDC1MyzzuD/Ca2ZkQ5M0TtFJFxEBaI//?=
 =?iso-8859-1?Q?D+lHFSeOOR8cxJ0P2Ueo1LEqU56wwvybD8+51HvFDiv7K0uvyT0QWfT3wi?=
 =?iso-8859-1?Q?outW3KBRw2U8fh0ZbN9mRzTuvPzdD90/u+x/Nlv8eTlhhhSeWpEFtWuxml?=
 =?iso-8859-1?Q?UC5HXeUnIfM7WtHkO2xmHj3nR9GpcposvxoQj7mu7QbXa0npP2FUxH/eVx?=
 =?iso-8859-1?Q?toiq9pCbpT6fTm0OvOJujATpNNCj2kTLtLn/YIpiBgNZP/M/wWl6sfX/aT?=
 =?iso-8859-1?Q?xCxk4e3lzCr9wXXbJ7Y1zm13JN9MUY/r58Gt4yNpUmKKx1LpaXFWii1EsP?=
 =?iso-8859-1?Q?jFvG00ZqJ80EGBWJlSmZgUnDScbnVkuDn2T4Ba2TWgbjHHhfhSqH6UaOK3?=
 =?iso-8859-1?Q?/dtydI3iuJ3froaCSS/5kO3h3EuYvaDxhoGXUDdCBR4/pB8XePi0Cu46lK?=
 =?iso-8859-1?Q?iydIKZSXA0foPz3+LspknVNZzpzMWc1248KNChZ03DuCYdwaPvw65AwcHn?=
 =?iso-8859-1?Q?ynnQUY3f0OzRdG6p1WyH36ZcM3E+UD2pLOPNU69LVP5ExdiYPB+cGLVG5M?=
 =?iso-8859-1?Q?ejAa6dhf7TKbkIa3c0R7YJFO7GD43KBGnYfC6KxHsS3N3aMw2HjbtlZfuk?=
 =?iso-8859-1?Q?pk1+Kq2LhYHXwXQewyW8lCzSwU2N+UnULGWVQOkZ2Ci/ZbGq7Kt1rr356h?=
 =?iso-8859-1?Q?8vYllfDlXEhp9ornZCu1EFdby8iPAuF/xyuhbPlYpFhPXiMuxXB2T9OeDd?=
 =?iso-8859-1?Q?5sd/EUtetF1nlbpM+Vxz1AUBYe65HJCSDbVDMWnf/H4axtsRZD3nYix+A6?=
 =?iso-8859-1?Q?7uwXife+NnFZVJ/sUI1kI8JiCKDGC8goSCYc0a2MtqrXG4OIfhei4lULlD?=
 =?iso-8859-1?Q?q/tya3Jn3kw8dWl1zDD60GiavMkhwpuMsOVC6h3cgtG94uCE6osAeBWhab?=
 =?iso-8859-1?Q?GizZYXOzogBv54CbQ++WElGJQJNjlFE96XC0FAB3Jb7CU6Z2hw4BL/Khsy?=
 =?iso-8859-1?Q?QTG5Szj+sE3Yschso/OR+z7+IzZs2y7dPXXfQzURmM/qZoBru6TKBniqal?=
 =?iso-8859-1?Q?HTzAshWux1e/vwTPd72Juw+CJsj6oRRs2zRnoMiyZHHv2aGtDgtqh5pRGz?=
 =?iso-8859-1?Q?s1/zCWGroRvHC9dzcU6svIzB7VW/lyML0XGpuPD323fkUhWQZACQujzgHX?=
 =?iso-8859-1?Q?riN8QEXmFndgImsh/efN9Jk8VAsEDXnTkMpNIua5bJoe2Ynfc7kVEJDwG0?=
 =?iso-8859-1?Q?mmV0GS61D2X+5YbUjhO7HolQrZRUyQE2dO+voA0JxCM6fzSPAAyvw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4cyuT9wiMA2nsxV/7vXfLta9jmOAU6M4XtqZcJyypz1j7h5TNrr1sYcpQe?=
 =?iso-8859-1?Q?gBtYUWvEXL+CZ8J/522MyHrNt0XQohE7EfhZcqY/VmspJE2yYOcpLugmF+?=
 =?iso-8859-1?Q?xRVjkBa6OqVvDygRanLfzs4+I1DmjONFqs6fb2zFynglLA4puddTHJkOor?=
 =?iso-8859-1?Q?UnMj8+HEEs/6fN2k4ZnO6B/C/10/o4zCkKWmJXYVAMzygfr5VVNYomb7UX?=
 =?iso-8859-1?Q?1LVRpVK7mCe7508nFRSDPZw4bO9j6C7M3HQabVsAW6+nnL7n9TWaN+GL9y?=
 =?iso-8859-1?Q?xLQlik9inmeiI+wvru7jgJRVa5vlircsyc+u+XywF13z/sqjlopr0CbCRa?=
 =?iso-8859-1?Q?F0y9+uQVA244oraQ6wkQM7DA9RZmWgPdXk0oGPtEGy0pWaYDAhjDi/2Kih?=
 =?iso-8859-1?Q?UJShJDfOVVM0LSkWh55R+TVUZnHOJmZiUkChOcIRgEZwkvxaHXIXk4eKRi?=
 =?iso-8859-1?Q?WA9QZ0xrj8Jo2/Ke5Br5VlP4Lpz9Ca5eCUg0t1B0fXgEh70uqRrnC//gkV?=
 =?iso-8859-1?Q?sjh3XQ+wLqHCUwb+pdc74fxd5fjZoCCOmQifqKyaOsMgTCswxq10oIwA9V?=
 =?iso-8859-1?Q?35azjC8EU1168ZZXzXa8YdIaHuOhmqDjaMcVsAjsD/5aWalgqZr4GfRevZ?=
 =?iso-8859-1?Q?5/YUfshTpU+oDT04c0VC/Zm6NZqtIDaSpAxl4LJpty7q0iZSo/c8YkW1pP?=
 =?iso-8859-1?Q?EjThwHmSugM1DreMmT8mDjeqtoUK5gyJFJ/5JwajoXt+9nlE7tdHcJWEJZ?=
 =?iso-8859-1?Q?sdvZMU3cqyL23bJeNg3JostjPhI7dTq0MRT9eXEEQUdLMsApZ6o+WBWp/4?=
 =?iso-8859-1?Q?9P793a1qgXJGTFZWJMWavJzzf+h1QP1dobcl/IlWuV4GY0ihEBEUUBYVNO?=
 =?iso-8859-1?Q?CQKRIh9nVKc575ulFCTKIx6ZVYxmSPv9qm378k1eJGVdB413RncxzwI6My?=
 =?iso-8859-1?Q?cNWTQSezBQe+8I+83jxyYY0rkmJwTbscVuzgQuC/ENiqEaap2iXfzuTFEH?=
 =?iso-8859-1?Q?rPD1LhiqA/HxSMREKRam6o1pmxwp3+a45WhOrPz8BMktBEAtrhDUwmSGVA?=
 =?iso-8859-1?Q?pKVKA335/a5dVgub+CZeoT9Ge44/bUbOnR1EdTM/0XXJ2iVIkdE7n6f40d?=
 =?iso-8859-1?Q?O//AmooevTGK8Tf2i5j62uhouz1gkz/SGtK+SnFSTnjM8BYKras3PZswFr?=
 =?iso-8859-1?Q?Vpm2vcCa5uQagDjHwVJywLuyTAlbWlksWfwDpabO8hgRVQ3SFhGvBcoQ31?=
 =?iso-8859-1?Q?EFsVIXKg9Hsw+PxhDidCjnOcPlRG2IFgAWBTAZ9zBxmi0U7XoPc/bZ0R+j?=
 =?iso-8859-1?Q?fE6Unhzpq1XYie5dDUbXLaOWglP+2bIjy+pln+YB5NhAPbDdN66pbuTd1w?=
 =?iso-8859-1?Q?+XPouTg9Ce8gPWB8jXw2IxlgRN6iDU0Vz/BYPbvWJaO8mCo3nFBpmp+E94?=
 =?iso-8859-1?Q?yQ0hGWgbpjElM4vjeECwhqVk4s6paiah6gPft+zYHoo4JeNLkRCGBbFEvW?=
 =?iso-8859-1?Q?sGOe/ItTm0d6eRSm+WPT17GZMGDm5iWrrf4imVFzKZQxMwnZ9kexlElSeQ?=
 =?iso-8859-1?Q?4ft4ffpUmtdRWboDmeg4LS7uUV/urcqsUeNy9SDEW0uRiJ4FONBNoSkRR+?=
 =?iso-8859-1?Q?eejmTj8FoSX8s=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35918cca-7ec8-4d5b-a6fa-08dc8a3d9faa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 17:40:45.5658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: buJXLQ6ifmYBkbhQrwfkA9ld2h+/Q1vXnjrFZ455fxaKhENmqmfqpZTaEUkCAVN4q1TG334UZNSkXK6S90qbuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466



> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Tuesday, June 11, 2024 8:59 PM
>=20
> On Tue, Jun 11 2024, Parav Pandit <parav@nvidia.com> wrote:
>=20
> > Hi Viresh,
> >
> >> From: Viresh Kumar <viresh.kumar@linaro.org>
> >> Sent: Tuesday, June 11, 2024 11:06 AM
> >
> > [..]
> >> diff --git a/content.tex b/content.tex index
> >> 0a62dce5f65f..e2a836327818 100644
> >> --- a/content.tex
> >> +++ b/content.tex
> >> @@ -631,8 +631,86 @@ \section{Device Cleanup}\label{sec:General
> >> Initialization And Device Operation /
> >>
> >>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
> >> Options}
> >>
> >> -Virtio can use various different buses, thus the standard is split
> >> -into virtio general and bus-specific sections.
> >> +Devices and drivers can use different transport methods to enable
> >> +interaction, for example PCI, MMIO, or Channel I/O. The transport
> >> +methods define various aspects of the communication between the
> >> +device and the driver, like device discovery, exchanging
> >> +capabilities, interrupt handling, data transfer, etc. For example,
> >> +in a host/guest architecture, the host might expose a device to the
> >> +guest on a PCI bus, and the guest will use a PCI-specific driver to i=
nteract
> with it.
> >> +
> >> +The standard contains sections describing the transport-agnostic
> >> +parts of virtio, and sections describing how individual transports
> >> +implement virtio.
> >> +
> >> +\section{Virtio Transport Requirements}\label{sec:Virtio Transport
> >> +Options / Virtio Transport Requirements}
> >> +
> >> +There are some mechanisms that any transport is required to
> >> +implement, and some requirements that devices and drivers are
> required to follow.
> >> +
> >> +\subsection{Transport Requirements}\label{sec:Virtio Transport
> >> +Options / Virtio Transport Requirements / Transport Requirements}
> >> +
> >> +A transport provides a mechanism for the driver to discover the devic=
e.
> >> +
> > I would like to add a normative.
> >
> > A transport MAY provide a mechanism to create and destroy virtio device=
s.
> >
> > (for example PCI transport provides this).
> >
>=20
> I'm not a fan of that statement: the transport already allows for the dri=
ver to
> discover a device, whether that happens statically or dynamically really =
is the
> choice of the transport, and I don't think we should go into that much de=
tail.
>=20
Discovery !=3D life cycle management of the device.
The whole purpose of this section to clarify the transport requirements sco=
pe and guidelines for new transport.
And if its incomplete I don't see a point of having this section at all.

Anyways, not too critical for me either.

> [I'll go offline now, so please don't expect further responses from me ri=
ght
> now...]

