Return-Path: <virtio-comment-return-8468-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19109C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:51:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7620677C0B
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:51:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6B66F986E2E
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:51:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 618A6986E21; Fri, 17 Nov 2023 12:51:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 53BE0986E22
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 12:51:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AX2WnK+8ZtlFT3n9zvCmkLqz6dl+eAgOWjiEJP+9xC0ZjKI39kMTM9LX+PdbVFU2s6l0B8etfEdndpsO9QljkpnjVMrjza11uoqRpXm6X01IjPUBugvgWO8u0hxCo/MYvfUsD0Dtd1wa24Hf5okVF59xnALmvRiFDS1o3nSuVuZV/pu4yI7HgnGWfbP/4iJX9gmE1TjvuocbOL/HuOvcspt8CWwf5NmdfaJbkN927v7SXaozJ3Wo6/gkfvt8k2e6gHZFQQsMDAKQC+xm0UIsDynwXTSsN2Fgt09dE71O7gkxrrS8uMLFagOpfuN8dqqapW2CZo6tK1O1Y/hckNJCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aldycvby2Jh7u8umrtpjq90U+BTcYdh/IVkBQ7CnyzQ=;
 b=SMe+JGSGkVntEN9lQtLB12Gfi9wjya7U2uElVZyEGzXs5dfLxua7kMa1Cgz3Z9f3aiSHAT8Ioglr02SwO9lLI6l2EGUR6kEjTUTJ82ZD0kWbjnSYHzeFo6mywCMpQgOWhQu9KA7DGGI7nzFAalHFZn8qhQB7CJ48bJ/LqgeABdtaEACaW2P6t12+M1NkfLVrZ5fd36ldlIIb5IHbU1369vbMjbyE8SfSqS/AYAvUklJwo68blrmXcVGlin11P+wOGHYVR9QUls/01wHbWuKTcKipsIRMuq3L/XaIolHx/A2G+ZrcmIWMIuLoQHNNgsjbtbVwBQtuJbqgstZ+Sk669w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCAAGEbgIAAB4aggAAG2gCAAABcQIAAA3mAgAAAL+CAAAy2AIAAAzkwgAAMKgCAAA13IIAABX6AgAACmVA=
Date: Fri, 17 Nov 2023 12:51:34 +0000
Message-ID:
 <PH0PR12MB5481CD9329189829A8A6B6D1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117053117-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481632B9E440DDCBEEA7B75DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117062003-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548133582D377B3FE4BB9F6CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073917-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117073917-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY5PR12MB6060:EE_
x-ms-office365-filtering-correlation-id: 8f89c53b-2ae3-411b-75d5-08dbe76bee26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rKl0bXp8hPBNLe4PhrWYGLz+xdmXuZ0f+qBvXViYLq6Um/FMIhfJ+IuUxceR9K4zfC68dB1ulnADvmwKz3kgsK32NdaYXsGflguRE5Mg0O/ilaUiIk4UBfWsY4yBYFOxAfcfoIj6nVk2b7hCL6/GtRmr0oZzueccNsWrDpcJfm3M7SrTpvQrj97lKWwsD5NQJwlYFvxqbKXd63vRtLzOWLQeRb06Cj4FYPBOVhmYEHdl8QWVRTPYXNsSFyTwkSfrq5GPfFKaIDtGvJEvnp9aKdLN4baxkK1ikstXrSyOcxk2pjvoeOrdPvoIaKRQM8e7jR4R15boZyHZuoqpH1A1ort+gmNnbfsY05SNOfwDzupqDpsqrUqunIVgHRA8b1GQIklpw57Nghqa37csxWDMyaOQymwZng3HNveFqw9KzeyLNHjCzQoAsKe6L8bEXe9880zQcGV3vr/nG1VfOWPZN4EhcxeO9iY79JjNhEZAifrIYv0NU8lRZ4ETo1RS/gha2tnJt/0viwDEFFFU+hLyuBYscLbj3PLKE1IWVUZjSbZDnDZoL41qvBwB2+okbmcRsw3a4dTQNdn6wT+G9XAfW38FdJZWPlRHNXbGhUTRyu6MAZ1Vk7gUvkCXi9rbnS1h
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(86362001)(33656002)(122000001)(38070700009)(2906002)(478600001)(71200400001)(6506007)(5660300002)(7696005)(55016003)(55236004)(53546011)(9686003)(41300700001)(26005)(52536014)(8936002)(8676002)(4326008)(76116006)(6916009)(54906003)(316002)(66946007)(66476007)(66446008)(66556008)(64756008)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nBNHtbQ31zpnxibQZ8mftFUcMLu+ljgsETVs2HLiDS5WNwnx+cbt/vucjm0c?=
 =?us-ascii?Q?qhJUUk3+/D2QIyHptnenScux0nERiY5Q67/E4F03G0zQyMNivN2Q7oE+Uia4?=
 =?us-ascii?Q?ZU3HsFBqyzyXROIpk9USmEBJ75klgAvo184zToJ82fhkNPHWHIk+qMNW+M5D?=
 =?us-ascii?Q?Wip/YEM7Cz24xGXxctiJnvUNrd0MYErzX60OkDmILpw3kyH3vQQtPYZdDGzb?=
 =?us-ascii?Q?PP97a48f+FFscwH6PT76L8cosrcxtjNOYr7ewO0sc59m8XpGxKs/0voWAQD/?=
 =?us-ascii?Q?P2BgiQf/UZt4MGzFz7XzoZt+3CR1VDmX+F5zFBagNPIHDA0zeLq/SblGfvu1?=
 =?us-ascii?Q?u1T+zbtiugWP8yFJBcQ/y1uiVcZCXIknadkYyMKQe/rH0byouo5QSt8rXTPp?=
 =?us-ascii?Q?WYej8rvKG4VvzZaTwdnnScUKj5oeGVab2gNW9DZ/x8yLq05htGeTrMkeeN2M?=
 =?us-ascii?Q?BanpD9KMp7MBsG0Gl7SOn+ANacgA7rGf0f0Vh2SKj6jDlbNnLEYkI9df/3+y?=
 =?us-ascii?Q?K93l4vXbPsxqcnFwvxkLQewVIkZDZ9ypKAhY1iM6T0xZkz/rPY6vR+KqC/Fu?=
 =?us-ascii?Q?zLAC0yj96y6+gMQ4RWaW0mIJdNtO8YHJnHhGAg0IL1bA9bzN3zmXpqm5OZTH?=
 =?us-ascii?Q?n3a/hBpC2nsQW8Q80nAXlnr5DGDq5naHbzaKZs/FBsQvjlK+IOdcIWF36JRa?=
 =?us-ascii?Q?Rv568OQlLfPYIiBAAgLP/87durJN1DoCJmZrT0DGR5brmKsQdpiLJJ2FOvpS?=
 =?us-ascii?Q?yXPYhDxzT2uRiPJgwXW1mmZG96HnoRO64SJ4UplZD6Hpohql9Y8guVENKkHL?=
 =?us-ascii?Q?otO8boS4RW8+h9I2kdUPqZkxPpZw+OitZ1qDZi8b5oOHbhIS8W4GVtxcWvpt?=
 =?us-ascii?Q?8QiNf7LxXt9ji6dN8iRi+1YhSxrXIbvng0cUS9UjlSAhhyIr7Wty89g7e6HJ?=
 =?us-ascii?Q?rfGgAF2y46GVpqda4YqnAF+enFljASeCltqYGRD3A8vb1gJwcRRz1urp2L/u?=
 =?us-ascii?Q?Vd+ZpZ0zOqZnQMe/B45NenVjcJ6l8STgc/JuCfj9aTRwzJoEMdRbzIh+vzVj?=
 =?us-ascii?Q?PmB2Q4veeSo1yebs7F1O+pUXjOnJrNRVhzzi/hSfyncO7hJmE05+J8bl24UL?=
 =?us-ascii?Q?TVmlEys8iQhxZzkWS3ylEYM9q9RcqoDLvYAcBCkN5czmiEi8Ikj7HwDLbj0n?=
 =?us-ascii?Q?D+ALtwRjGrIjAvUaQvbUFC1rbZtPEHKMMozkivZOiAIEj6fpFgipS+A+1NTD?=
 =?us-ascii?Q?wYmMUWXZzSHGJPHnilqSbzicH8gDh8YERWI4kRhDm3VNvV1NiLM7OM6FYLe6?=
 =?us-ascii?Q?zO/zrGqHD+bC7gKbTyB/RfFhQTvHogw5QZvCw5mnP0XI1wE66qBVg8BlhlRo?=
 =?us-ascii?Q?nQujv6ga0CNv28GonJP4GPvrQ8RqlLsXqg5BAuvyQusq+4j9mjYuPCzX8e/4?=
 =?us-ascii?Q?kVZp8VoCCpkAPI4lgOU4FjQjfBIKnQtHzxaQFX1s5uLPptX8EVOyrvtaAIOU?=
 =?us-ascii?Q?P4oJoEtieYXPLVBIOjjTkiANSsfH0eGgfBt0nO7zFaurh0AIt/8KUR8dhyw7?=
 =?us-ascii?Q?Rz1Qpb6fu0Ze4NeBmTE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f89c53b-2ae3-411b-75d5-08dbe76bee26
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 12:51:34.5519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8w4u4Nrw0Y2ytgcPCMMM/FYWqOzHtfT/STwRtahh/dsRfW8TWdm1FVZWUX3IET9dgse9hEJS613L+cKLklhRtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6060
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands


> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Michael S. Tsirkin
> Sent: Friday, November 17, 2023 6:11 PM
>=20
> On Fri, Nov 17, 2023 at 12:22:59PM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 17, 2023 5:03 PM
> > > To: Parav Pandit <parav@nvidia.com>
> >
> > > > Somehow the claim of shadow vq is great without sharing any
> > > > performance
> > > numbers is what I don't agree with.
> > >
> > > It's upstream in QEMU. Test it youself.
> > >
> > We did few minutes back.
> > It results in a call trace.
> > Vhost_vdpa_setup_vq_irq crashes on list corruption on net-next.
>=20
> Wrong list for this bug report.
>=20
> > We are stopping any shadow vq tests on unstable stuff.
>=20
> If you don't want to benchmark against alternatives how are you going to =
prove
> your stuff is worth everyone's time?

Comparing performance of the functional things count.
You suggest shadow vq, frankly you should post the grand numbers of shadow =
vq.

It is really not my role to report bug of unstable stuff and compare the pe=
rf against.

We propose device context and provided the numbers you asked. Mostly wont b=
e able to go farther than this.

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

