Return-Path: <virtio-comment-return-7720-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111E2CDB47E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:57:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 623843309B
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:57:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42288986839
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:57:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2E50F986836; Fri, 13 Oct 2023 11:57:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1DB79986837
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 11:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGsDTFge2jfbEKC5ttV2sQW043WFL8AnDxrDhNlLUmNlXMCyHbBtfSCs3w2gGJ2jqmZAiNa/e8r4KMFNHvdzSCjCgNOw6V+6oTh3jTQPwYjVYsv6ge57USlVsNXK4fSYj3F3T09uTUtbfutbzCuBL87c/FGLDH9fVzRSIZDsXmrI3/y134ixDJIJ8ptb3T34idJHvt1sHz7cPQDDLAxWUrLCfM6vPVaaHm9EBhpHMta3R/SZGky0Z3QDBMeur2LHiTDb+phkipQl5/C1DqtovOslxaf293vSBbB7S5GQtO9nF+7TfAiFeveVqJ89KhxR/9gozGkur+4Ld26HqCfI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dQ2G+P2B7o7EQLAHZX5rdafJk9HKCnxZC3W5einAu8=;
 b=LKPBaU10mlYYz2KXEpjnF1AbvuK72BALX/F4mtdkF3dBwF1vCcDMno3MIh6sZnJju/p1V0hu7dSTO1j7U6C5c9DWlM9wBwLdZpkYWWv5b6Ytbycuw9Qha0cvQTy3CwhMwaAZu6iMsSdVRDNkaCRjQz5K3fBduypLt8A6oOAcyAgasZAnSic7OzNdeFf6vEAPaasXfEM8NqoJ093Kt6JJ42DtVLokSc1M7SOda+2I/9NINfL+hobRgs9AkvQMs+gtGy3DbnKN7EyDVlRloTEXnNNiootRrjDKAm58gu0UaHDzDvzPm/VwF1RD7JcdJ4UxGshm4rm+ELMun8rhknmF4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAKpSgIAAAOPggAAGVACAAAC90A==
Date: Fri, 13 Oct 2023 11:57:51 +0000
Message-ID:
 <PH0PR12MB54819CA09D81A78AA9220227DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
 <20231013071610-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815DBB53ACE0C91A915B4DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231013074948-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231013074948-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5080:EE_
x-ms-office365-filtering-correlation-id: fafe766d-cf40-4cfa-5bd6-08dbcbe3a065
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +aMQpnwpAjeOtYAOavFZKfP8XeYADpP2cgsyd8dpTvhsPGXrkhfu8iN5Fh8IJ/n7DFMy8+eDSNUH1Wj2uBNNZzfm5JAzkflYyJGWQkU9lpSjDq6z3THg7+WG4JN7qGcqnxZv6B72eArWLYPB/5OgapkzuEciCOzdKYxmUEMsvwgtzzOjFevGhy+0hKUWvd1Ti0HKB+iAXJjLe2bnhw/NYhlIC7u3wx8VqL6KQ8xekzTdxKl0jOFcpHi/aQV0wo5pj3JcRYrVrMr/RkENLckf0q7/ldq/MUgCCFauaIKyI/nLLgQLvclyJ94XM2CbAUb+7gUTDBPpD/vrqJyDvoZP9HjzOP+Rrb6It/K/un3MynMguOMTINSZto16ztDti7U5ZSSHPzS+D4MknFs3whpsy0ennYS0b6o4apfoIrzWjR5cA5z3dgxP1KnCXuFRAgAlK3GjyFVKQp/mhtiH0cVI1sKs8i4Clz4T5f128CaNq2CPFDUDzQL69dXPI1MX4C3NqMJkJXXGjYn0/TYN82Re9gEVVnT1LcPkDzWCPHPj+KEsp9fZ4av8tA+4mKxkGd5/jAmT6/5HTfkLE13NBptatURvDzNuNnFBKPV8K2ki9LIeC63wd3zhQeuEtZqSR3j1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(71200400001)(9686003)(6506007)(7696005)(478600001)(83380400001)(107886003)(26005)(2906002)(6916009)(54906003)(64756008)(41300700001)(66446008)(66476007)(66946007)(76116006)(5660300002)(66556008)(4326008)(52536014)(8676002)(8936002)(316002)(33656002)(86362001)(38070700005)(38100700002)(122000001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RgUP2UKucruQrUZ7tGdCkp9Brn7FOdghtrOfAQryXzhERJkJUu/K3CQrUyXQ?=
 =?us-ascii?Q?gJ8OmmF7gf3Vjsv3QLPfVNG1PzuKEen8rVmL9lb0fWociqr+kommrZkjB0FT?=
 =?us-ascii?Q?piaP4H5uVtsRJ12WboX7tx0CAXROgMyoE4wln127dIkx9/WcP0VEjC9pVgXo?=
 =?us-ascii?Q?HvX1oQEeDNsTkeEiP9y1M0cHgCS0e/Hc4zx/xa6Vda5P24T4XJnKt4S/AAAu?=
 =?us-ascii?Q?NCfgavQMa2NvfxyReKK0jOiIo44hZGOBpz5uN1/Y9ugMO/9P9eXE101Vu6Je?=
 =?us-ascii?Q?/HSbSd3OQd+JF/dK9J8hb/2B2smKdts3aVW/Hrs0BepvdEbsBKvM/6ojQtmt?=
 =?us-ascii?Q?W+M2OpaVtMgGMfdDXDmyR85oynhuT6XjOPkB6qUWcB3o2TjEyj9LdPv9o0j6?=
 =?us-ascii?Q?7FB9hSCgidtDh0KfRZ8PaPrmBNw9ndo2mKMclYuOK7G6GjjJ9jzur2Se294N?=
 =?us-ascii?Q?tYILFUanovzwI9aFutFRirbvZHSDZtR9ZzYEulju0QdMFqzUrF2RMUoHo7Mw?=
 =?us-ascii?Q?Ze7CR1T2G+jDFjVSa+GyCvGfGLzVGP/x5gOUJVKUv76BjDAc+FsJQIbH6px8?=
 =?us-ascii?Q?UQwD4zqASx6O+0m128Rj1mUaOCMYmhFm+6aJLxGlBmxkMC5BpuP6Kn81rxBO?=
 =?us-ascii?Q?GAcphnTEZSvGyOGVPcblhygrtXoyyPy+kqBTcn4IfHUSidmGHgGYpKHerdS8?=
 =?us-ascii?Q?GnWaIxhOjGbeS81CMG2P4NA4QV3hJrH6CCC2/ZcbtGSe3fK3ya4LkBkimx94?=
 =?us-ascii?Q?nkcV8uOBjU7CjTODE/bW1ApwdRUWWn49zXqS3oKXlgygBK9n5eFvs+/rZgaY?=
 =?us-ascii?Q?UsAN/ly1ajbYzY4lL1pR+o9pnip6lSw/Cwi+f61che7jj4agdyV8NEu4r/fi?=
 =?us-ascii?Q?okz8rtZ7Z4ihFlFkEi7SSPfbOxEwJXMU32r6YTUS8IZVBEnPSAAwxjDt4Ytd?=
 =?us-ascii?Q?N2nkp5zoVJhHkL+5ft8cMFaco0YktRSDoZ2Yzd9puOMSUanUqXKZ6SiLcc9r?=
 =?us-ascii?Q?dT2YPAvhtTyGgm1gtIHNDZKz/6Dw+NmqD7TDHEUhv1AqAH2CyrrnBIyZsWZa?=
 =?us-ascii?Q?UMJbb9kGfup8Wnh9qol8CZ7BVxMlFxD5r+5xLA9eaJTldloRdRNwCi3JK7oC?=
 =?us-ascii?Q?dj6wrRg0jWfdfNN5ugxWL/A0T8+nydDGZeibQerVBIMiserxJ4IWTel2H9er?=
 =?us-ascii?Q?eMZ5EQrsaUA6GqA1zsoWf5trezf343/CFczwR0CUgDc48NUoiiJtNYxSc5DK?=
 =?us-ascii?Q?zKMwDUyjIdNFVihe/aorYZs7hSqDbLzZi3+4GqVXYI8jZ4na8Nv8sHPwK2y3?=
 =?us-ascii?Q?cPBltguyEceXBfYFKdQKXxWvHoeNl8JVkVf8qf5h6S0/JzyVWKSO+pRsDhM/?=
 =?us-ascii?Q?loHLV6vF5fT8x4khdCi69xD/TS1a5uON6qipighpgnfzOvBPOp87emRxOUcv?=
 =?us-ascii?Q?kslu7LtGdpkOu1eLEcdNMwfnlLAcbZ/XsHsWyEOAPr55SZpxNa5Isn+l4b/+?=
 =?us-ascii?Q?cuY+sqmNZnPMRdiezsb6j3bMZbW8umzpFp7IlgOcKeQuj7A3PQ1kf09atDub?=
 =?us-ascii?Q?gFBK0D/0mfvk5OeNki4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fafe766d-cf40-4cfa-5bd6-08dbcbe3a065
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 11:57:51.1751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K4w4p2menbxmLRwGfZP7FSOh4Fe2B+U67GDi0afXOoHNV/5UjaSwJs4WYE9HVWGvaCu3K3lZqLkjyoaB4N7vBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5080
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, October 13, 2023 5:22 PM

>=20
> I know much more than 2.
> There are as many approaches as hypervisor implementations.
>=20
> > 1. Passthrough a virtio member device to guest Only PCI config space
> > and MSI-X table is trapped.
> > MSI-X table is also trapped due to a cpu/platform limitation. I will no=
t go in
> that detail for a moment.
> > All the rest of the virtio member device interface is passthrough to th=
e guest.
> > This includes,
> > (a) virtio common config space
> > (b) virtio device specific config space
> > (c) cvq if present
> > (d) io vqs and more vqs
> > (e) any shared memory
> > (f) any new construct that arise in coming years
> >
> > If one wants to do nesting, the member device should support nesting an=
d it
> will be still able to do to next level.
> > To my knowledge, most cpus support single level nesting, that is VMM an=
d
> VM.
> > Any higher-level nesting involves good amount of emulation in privilege=
d
> operations.
> >
> > If virtio to do even more efficient than rest of the platform, I propos=
e that
> member device can support nesting, so VMM->VM_L1 and VM_L1->VM_L2
> constructs are same.
> > This gives the best of both. Nesting support and passthrough both.
> > And since its layered approach, it naturally works for nested case.
> >
> > 2. Data path accelerated in device, rest all emulated.
> > This method make sense when underlying device is not a native virtio de=
vice.
> >
> > But for some reason, ok, one wants to build the infrastructure, we can
> attempt to find common pieces between #1 and #2 methods.
>=20
> We can't just build new interfaces each time someone wants a slightly dif=
ferent
> point on the pass through/emulation curve.
> I feel this is an important point for TC members to agree on.

Right. Above two are most common (or least known to me that is in use) that=
 has clear requirements and existing stack to integrate with.
So better to converge than keep opposing #1.

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

