Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E83223AB
	for <virtio-comment@lists.linux.dev>; Sun,  3 Nov 2024 05:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730610531; cv=fail; b=a5H7tWUckPt2r/lblb9uMVrKqYi7LlTw+1ePGuqpQNljiOKmpRGnYZQzDLy9PWfu7Rkw6vzEsMtfexjBeUIqwF4DNcHZ73iH4JpQ9CcUinqsQRREjwW7V/949264l4zY4+LCulmArW7UeCm/+KL6gr2q/YNicE2RGrLq+PsZQ8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730610531; c=relaxed/simple;
	bh=7PnSzBxbF3qQLxpfISy2gIzXWwcDDRLEMx3YKbybFHQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qXBdm6sRoOSWLNY+Y2mbB1aQQx8geqjBAYsTIjxu+3bM89DihIRKzKpQ6sIAhRgR5h9DfyP4HZ7Hd/1rP9w2ZWyx/h9B1CkAC8p1VGnT1IoB9xcqr+ZozqJRDJ5SH08j3/X0/Il3PlsG+9mYjZQ4+y3dbxEuquQy+c+pArqramc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=msx7nyri; arc=fail smtp.client-ip=40.107.92.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="msx7nyri"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR08ubNW7kyQzJ+jaO+BQeeHLeNUfCbl3ZkQZK/RvFzeVDkFqpfoGCvdnqg6N/+I8WZDqu4AaQi56SlIHjrbSHF9tQQ+WaUDGszbfVnVBuQGFcv+V1NKapEBxYzZ6BJSgTGb2UcqilYu+lFaLg7PAkGqvnJxfbmU8g20suFm6dzLaDwtim81A20lVgHoYptlofS5tm5+GM3PjhTwCLK29y7w2eve+nCCxVfrGuntz5f9HSYPf21a02ZDYLD8QF1kP/Q/8UeXFzRik5jHRNsHLFDs/n9awi0rOJp13Qa/gblfOolG4ebYvAi4oYxlWjXINae4xpU0bVn+rvyS6pvS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sE0ZS2qc89Ss4lia4i34wHmClu6qx+HovbTmiVOJsmw=;
 b=ILilBP7Uag2iBnzPKjlUmqP6YQKJXrgD0FUSxlIyIPTLQGUW4KXny9EJcw4pxqROHPzIk7mXjxtRfyZmzWnza75mFH76tXHaZ/krkv/i4gj9lJdb/LHRa2YD3eU1042oBHTRpXbbfuEdg3MWhB16K+VGA6jK058iVwwhi+dteKvUj4foOs7aLBgl+C88YPAJQIGXFMdd/l61o8MPoqydgHufHGzZH7EmaGiHzafDFHqeukwOCEDQtm+6TlMsfYJqanQi1yyY6hTE15jwYZxcNf67QsWsN2GfVXT0EphPvinkgReii4jtf2kkm+KyKHfvrXVrohMdYL2KnwrsyeSvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sE0ZS2qc89Ss4lia4i34wHmClu6qx+HovbTmiVOJsmw=;
 b=msx7nyriQRhua7BRVTtkmq80UIRZTvXJfDXdJKw6qyHTr7iA2QBt9rHawSpQQq+i6HYAIn4vvMlDoBUJuP2zmz0BsG0PqfNh2b0QHIPmf23+2f+ZL25b8SiqU7rjX2pwmFuTbmeYWvUxAglaVjA17LidXbJ6qcCYPFCe+seTKkqK5XPKlSHFbOEC7c2Lmgs70sK+aWcvX/Z5Xqk8Bi7YHQRygdtDof78xIzuSdLpW72fFprnr7d7UUjAct4o84AchcHV2fiV6aqH1tGOEsW84IeV6sqmNc6la+YOEWXfuj/T3/AXmr+x4dKAAlkmmyTctCjZEyLZfY7DLNWRUGaIPQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH7PR12MB6491.namprd12.prod.outlook.com (2603:10b6:510:1f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Sun, 3 Nov
 2024 05:08:45 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8093.027; Sun, 3 Nov 2024
 05:08:45 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] virtio-gpu: Fix spelling error
Thread-Topic: [PATCH] virtio-gpu: Fix spelling error
Thread-Index: AQHbKCsZ98zw1//8mk+OG/3YA8oe8LKb7PaAgAkffvA=
Date: Sun, 3 Nov 2024 05:08:45 +0000
Message-ID:
 <CY8PR12MB719543FD632C84530F2057A4DC502@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241027044457.495730-1-parav@nvidia.com>
 <Zx9eG4VOSzo1UK7i@fedora>
In-Reply-To: <Zx9eG4VOSzo1UK7i@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH7PR12MB6491:EE_
x-ms-office365-filtering-correlation-id: 06e345e9-724e-4e42-bc10-08dcfbc597ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Ef5JD8aaLnDGZxi3ajkarHr0HjS7X/lHdh5yuSsuepfnXcJX6NDERWjKyNAl?=
 =?us-ascii?Q?Wk6pXQjoJqKpDkD3dloVv3CGkLKax0eAt7BvMXpAIj+R2Sz1Pi2AijBwjRqu?=
 =?us-ascii?Q?psCou30rICUsbJiKdxxO+bAfmYjimLrybpLxrRr9Ddsang8Qno+48SYEwG56?=
 =?us-ascii?Q?SK4R7/Fycv1mr6REWFPBDn/CKoI4BZ7O/7N0EdWDVZreg34oFgIoYZ0GfYev?=
 =?us-ascii?Q?/dQ+oeO7e8oIW8WnUMpqKpjCLU5tTH5FJl3NLqF3KDWW1oMg/OspW7V8rv0J?=
 =?us-ascii?Q?frqpjLP+jvjkRL3iWw4UDKj6Wwf9eluHeLao+zQA9k/0chBSfUUMC4PMFoYD?=
 =?us-ascii?Q?7sOUYCsma+WKwPaB+wThRCrA+2bIEQVeQJH93+CGG1ERuktgyaWYIzrs39EY?=
 =?us-ascii?Q?FH5AKbVemyyyzvybAMQLOlkfT14dJ0LSEI82su3uX6tDQ1g2kapiMaiyCNNd?=
 =?us-ascii?Q?aSQ/cn/rJSUd0KE6MWjJ6qfz0vbN9Lj9TTHdPxTfG43PqNPotNjscgtCFGvL?=
 =?us-ascii?Q?6mE/Cd36swIVgmDkiowsKnm1CvDXrQ0JWygdLQOAhUx94UKVzc2KCEj9oWL+?=
 =?us-ascii?Q?73ijpUcrh7IaHU80m2btBIKQrv/afsYildlcVmv16Pbjy/uVgvcd4dKiNmY8?=
 =?us-ascii?Q?R9qyEW9XJ/I1zmDlFiAANuEaXq+H+FzzAyDFmUZ88O5Didzq+5db3hwFgYA8?=
 =?us-ascii?Q?Uzmj75cLKG1+XZvHAOb227npucxDMHs4LnFutfjCPnCB+vvSx6t/PEu+KI9P?=
 =?us-ascii?Q?Spr+SRosMzCt0Ph2J9l/3Alt/ArBmhzeue0tjojjtySxwyIDElntRjFKVyKQ?=
 =?us-ascii?Q?Rph3plTaJ6kCm6V2qfZRK+vYCk2CnUXzmaemLi1DxbQqJziZBmIS+0qh8ADP?=
 =?us-ascii?Q?RnOErQhONWQUrTbmc4cPF83pmivMBp94jC+iErJ8KfnymLwkcFZHvKi0HSFk?=
 =?us-ascii?Q?lYqURYtQC/2wDpz6IE8LKak3fr1miu2bKcuiHwWcMZBiyJHPuiApHaYI6VDI?=
 =?us-ascii?Q?hEgG3kf1fcJRHwbMBdRraW4vPffIOsr5cF9IL19DSL70MOmk+qVU/97i/xlL?=
 =?us-ascii?Q?oTFIsb7FjC1ZX4jJRnFdOtnhNkL8W9x8/1I61L0DTO3iQFpFwCtvNJZJ8ACX?=
 =?us-ascii?Q?h1mwgpduPei6U/PndYr9FmFy+vqdWZ7TeeC7iCiIxbMZd1rNH0fuKmr+MfBw?=
 =?us-ascii?Q?9RAP21BEOK6+NhiNbUAXCkxk+ORiAss6YordIDkbFhBNCdKiO85qVV/TiM8K?=
 =?us-ascii?Q?L8iG1BzKY4Yp/7/4GzMZ2PFzC0oTaf95zGZ4K01OwgqmI3mTeNSFJwFIgCm2?=
 =?us-ascii?Q?Ngr25+iJkZ0AbKWzjfcWGcEb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VVdt6CYfsB7IMmhvm/pwOagOxdQBeVeDPmi2IoTGtSgeyCfKeEgSH0eLZZbx?=
 =?us-ascii?Q?x7IHu5P+Kf74apnBr0J0k5w9lNnHp2zN/WmynhOnSqDu2Ukv+rmjzzz+xeu6?=
 =?us-ascii?Q?1i+dc33/738btAkSfTfPyLN4irpamZR4XiGfAhIRE91+dQgRLHRA9yvrRdB6?=
 =?us-ascii?Q?SQz6eVEU+zG+lNr0NIPThgP/f0iZSp9y4e3MiFIwCx2bc9dEYlK/+zWVT0+N?=
 =?us-ascii?Q?mdcVVhC8Qzduy5lUPk3Px/i9euXPmvCCASfm1pw+/aX/o6FNoxx+DfbvW2J4?=
 =?us-ascii?Q?qw27bq2PjnvgzG0aidU8JRArteIsrJSU9ndbLvRbRf59yq0URMMIoh/XOy8T?=
 =?us-ascii?Q?EcEVXaa3MiWfefqXXaXbflYyZXXqDo6q3vVFDfJ7HIKyh4FmEk/5PCiSA7NJ?=
 =?us-ascii?Q?L9fYSPoo4xEibQ7QP4Wv9BbvBpIeoGljTgTNQFE6ObTk0uNTqEB0JtAS5Oyr?=
 =?us-ascii?Q?9JNuH7QgYtEaI1gvoi8VJIWd8B6158jaSgAPis/6t9CGq/BTtWhREyMajVa9?=
 =?us-ascii?Q?MaUNpTZdeWEhdkLtnIuBRzaBHt0IlB4aXEhmSaAP0C1cXTopKOIlwkA/6PoG?=
 =?us-ascii?Q?plg4cvQTqJKLud6bwer8JPQfh0BblB7WmILx+SsSRG0jpLDEnQvm+OtzVQE+?=
 =?us-ascii?Q?O0HpmNq+LGHm383W5Q/J7W5KRZR7hBJ9EE5xrnqzLxkgJ2H7wYHkIOEbPCyD?=
 =?us-ascii?Q?dqaVZGtjs4OAp8/uhiXpzDLHTJIeIpdaBVyyfttuXIIfTKpgfy/HR46K6Vu+?=
 =?us-ascii?Q?bZucexQ5gVeB/Ysf1WVfLrBZdTwEZPCHXejB8kH7ZT0UKpsnZzRfxxiiT2/e?=
 =?us-ascii?Q?4gj0fvhkZfuG70MpKNXif6Bm/+9bDvT46cTZqm5Q7dIXtEwOAU6Wkjy88eLd?=
 =?us-ascii?Q?ZzeYg4vnycVelodsHKRIwga+tHHlsZBE8MCYKOz+701+OWX0w5AYKwRRlajD?=
 =?us-ascii?Q?11un0o+9SfGx/UwNXFTRgtrxi2PLFNTn46WSKhEWj5PqOlrN3AZd2xixTXjt?=
 =?us-ascii?Q?uBx1z9fHoeuVx1fteFjk3PUQtLejyHHk6U/GamAGhU5VJSL/IO+T0cWLJIJH?=
 =?us-ascii?Q?2YXZXhSRJZISA0WAO4Y0sr0jqILJcE/Zt4EIUSWSn8/m1uQ1ZuLWPfzoFir4?=
 =?us-ascii?Q?ljETz7cWWUDXrLKKMjoNyyLLpzYZWIa5KoDbRiWtjUMF92QygwWAeSgRGcRq?=
 =?us-ascii?Q?r4WM/0fWAk3aInudatihARrSAutv4dFuAlsnGCy6LTlD6MUbFY90xNjYrFr6?=
 =?us-ascii?Q?UtLlZMTj26S7uvqSyFrcgh9NaY6QeR9p1HmUeAgmQzCJ8tMW4yadpqqu6+e5?=
 =?us-ascii?Q?FT0DcPVqIZi8T8gsJgi6bSEL7cyZMTrCZAhZQB7mPGm6r+kPpod4u7ImTaxa?=
 =?us-ascii?Q?n+MBdLCtQ081gfk5Zog/0jjsBcLhmGe/kUBG6FpK/3B+g3OJuQ8gWR4E/6+T?=
 =?us-ascii?Q?uQLXTL/yQzP4VAtCY6juOtMdH7p18ibz9OSyGCPnn1UpuQbJj6i5EFPxGELD?=
 =?us-ascii?Q?XlnZn/nHFVnPQ1hvhcUSHcdUTjDLo5byKrrtV4IluH2lo39pNwJxUtsfzMrQ?=
 =?us-ascii?Q?vzAQEKSM9srbx6HD130=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e345e9-724e-4e42-bc10-08dcfbc597ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2024 05:08:45.3324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CSfCWOBxCbnvBm55vcStj4tpqQGiwQBg9E65I59rq+JplHQ3THzlrrSzmBAxZl4ovKzs5m5UNoIajs6p5a0hGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6491



> From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Sent: Monday, October 28, 2024 3:19 PM
>=20
> On Sun, Oct 27, 2024 at 06:44:57AM +0200, Parav Pandit wrote:
> > Fix spelling error.
> >
> > Fixes: fed64230bf31 ("Add virtio gpu device specification.")
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/192
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
>=20
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>=20
> >  device-types/gpu/description.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, Thanks.

> >
> > diff --git a/device-types/gpu/description.tex
> > b/device-types/gpu/description.tex
> > index ba4ea76..c5706bc 100644
> > --- a/device-types/gpu/description.tex
> > +++ b/device-types/gpu/description.tex
> > @@ -128,7 +128,7 @@ \subsubsection{Device Operation: Create a
> > framebuffer and configure scanout}  \item Allocate a framebuffer from
> guest ram, and attach it as backing
> >    storage to the resource just created, using
> >    VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING.  Scatter lists are
> > -  supported, so the framebuffer doesn't need to be contignous in
> > guest
> > +  supported, so the framebuffer doesn't need to be contiguous in
> > + guest
> >    physical memory.
> >  \item Use VIRTIO_GPU_CMD_SET_SCANOUT to link the framebuffer to
> >    a display scanout.
> > --
> > 2.34.1
> >

