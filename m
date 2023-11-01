Return-Path: <virtio-comment-return-8072-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6934CC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 02:54:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A824C2B06F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 02:54:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 851AF986BB5
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 02:54:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6B145981235; Wed,  1 Nov 2023 02:54:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5BA6C986BAA
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 02:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7ZtsAGyZyF6CfSoDVNCfBwVwKSVDysO4Tc8+6k8/IBps8mmaVoX3WFE4TjmasrDLW7KXaj7g2qbA6nRvHwpG6mOXLCnB/kldltte6MmWN+mRHI47Mz/GoGCDEAGx9yZrqkrkLO9Tvvts8diVlajxcfarPKnFdxSPibMnyHVS2mC0bbrTuySOjHUlBJSx1djlT+0Qa3Q5QZeI3iHg7mPSWG8l7TwdBjPtFxDRuXhwACdKb2FKJybE+rIDytys3z1mwvIPBq3aX50Lnyx+sL2ITiMLzd3giDVwtzurpzN5zjcB3ZkZdcoBPozCwx1WCCZjMS1joKOLHh8h8Z6pEqLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCpxFOWzdXgA1d6n9Hfrf8O8wKy6mrTDu0NjFTXgM24=;
 b=gR40ght50JdjSAh+7OMquNeaLeBnl5NWQgx8WOHQdeuunC5d0ZCd7VWiSsbZjTQ6KHEXQNMCaAA2FDZAG93TaxMHuCtuxbPVUf0x5xSLHujsJeoZv7a0BRmzfoaXzqLPrbkOkodb5tzGLLeMmvN5izrEoxL89IXtChq6uCwV/sgGHj70/Xs01DHCogeThMj0FYNq+OK3Mh8395QYRkk0tNTAJyJvsb1MyhxCIHKlnKyXsBLjktoKDbJ0gGwBfeZxX7TqWr32Uy5HD57z4YuqJTPl/I3Dzf6//YAWvqpp46t5L/gdIOKjtLE/8svN1enJjFLwS+/MI1nvTTjWDLz0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAADeVYIAEiiUAgAAAXICAAZfSAIAAAE8wgALlIwCAAAFh0IAGFdwAgAAAUgCAAGlTgIAAAOdQgAGLtoCAAAjegIABFlmA
Date: Wed, 1 Nov 2023 02:54:47 +0000
Message-ID:
 <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com>
 <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com>
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231031054617-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|DS0PR12MB7825:EE_
x-ms-office365-filtering-correlation-id: 8c563ce1-7cef-4494-503d-08dbda85e915
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qAPBZC7hXOqMpUqX6shmkVpy9rNyPqDRE6mDyCfPHh6fwuX3qmVuWC2nyKetckuy4Y/TywtW5TPAVpngwzx1Ocus6x7s+a+cnxjdIKzGb34eFgLbkBEPJSiWewQpMtqVFD76snq0Tfb+DT8sNA8v631CnMs0BoJO5ZIaabjLWgaKFb9L5EkuL3yLaEK9P/+TigVv2nb9bRHN5oqrRUbcHjJzW7XCe+mzGqR/rCZ5w84bT2o9oPIVKyK7n3WCI95lrKICSej8g3PzaPg8JeUrdeqDd3ThP3ErNdQ0Tfwaaq0DMP0sVw8HHhsnZmkFnrPG9c3NXzTpOp8EbfdmPjvRtiSUSX38ycH1Kg+8pW7o8qClJQRSahyP201WJFpEwX8AtTUOY0T/E+3mZYrCQZV6v6tMKsWfczStzzOqTMIO0emGTVjuZY9HoRzDybfPvWpyZth+KIRsTpYy6CG1LrWfqm1M5xYvKYyOB+eRhGYyxMNAlpfWqnlB+TcOZwy4Idc2PkSw0ueHexqO627+Tl/QGCkh2sMSLqTL+3WiiHOXkhZ+REyxTGmghYx4jZUAyllTccoG8+aj2eJ9JgrGqL4ZRV1G1J8keYOFTOP33euS1Ss87PMEPmyzmueHHCMSaQbi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(107886003)(26005)(6506007)(7696005)(55016003)(122000001)(38070700009)(9686003)(38100700002)(33656002)(86362001)(83380400001)(5660300002)(66556008)(110136005)(76116006)(64756008)(66476007)(54906003)(66946007)(66446008)(52536014)(8936002)(8676002)(4326008)(41300700001)(316002)(71200400001)(478600001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/lAVtRl+d1JWg5fY/LOtLNRCkKKbEDIGe3HCBbYYiCBRsEXGMUatbF4MiTjB?=
 =?us-ascii?Q?LCYIARf541hZQVL6aUykruaIjqPJi8PgjD8aQg420NssEyz228KvnLQ2O0V+?=
 =?us-ascii?Q?Yx2wHucTqqVqD1FaPxKX/k1zGFdz2ZCX08QBUuNVVi2d7bVy5gPCvEKiHcV+?=
 =?us-ascii?Q?3T1Si6MucF1dLrBaZ8+YHhj1wG5GciRIssX65n/9sfAIVmeyYp0nZ6wjjPZh?=
 =?us-ascii?Q?8+IuVQhN/unHvnS1rqDknfF4e3KcuQN4ts1bs0ORKjr1mCp50gL8+7WRoFaS?=
 =?us-ascii?Q?FCppI2jQbnZVH5LmTXkXuSybiP9SFN98Aqe+KqdZDOYnn9aWAjbQUayJ/ZrG?=
 =?us-ascii?Q?Gbe9+2FqieoT+wdKjI/+Vw1GpiJ3ucgQJLEYBk4cvhDcMqp4v8MXZb165RpJ?=
 =?us-ascii?Q?1pPXCN1d5X4mAtIwo9PNwRYGKEX2G4E3BF0xqqSyy5WduoYL2ipxPmo5sfJN?=
 =?us-ascii?Q?f12XFjEVcAJydzOMWbEf9Q5c2uZgD3TpeKRj/PUedlaz7ycfJ3CjSkmTu93H?=
 =?us-ascii?Q?qNpVHkX2DzxY0RmrRAfFJQ3GK1V+HI7Lp6a+bS41AjC8S/gwQiVBbIKm2QSY?=
 =?us-ascii?Q?p4ZSzLCHCkN+kxWnF6CBoLuqiJjq6khTA+1Q3FXtNM4l0Mwxv/mc54M2GO7y?=
 =?us-ascii?Q?yZPuiyIl/pAj9vcrPRDN6Wr7wlfKPl5+rZTabHGOC7ljybDfCzh80quCdS1x?=
 =?us-ascii?Q?isiulb7yas3mlA4u+RPpHnhakKVsnH/CAaMgW1hHG5K9C1ELX64OUuAD5V0f?=
 =?us-ascii?Q?hKwxfA1M6kjmEOHn2XuTb+JSQbCcgHLvCEwO/AzF45kjEMbRZyIhe6S9VHxi?=
 =?us-ascii?Q?u+CtjVSwMyManySCU2q5shWYek9IBAmf1X5sErVBJaE6kw2V2pCrrjuNInIZ?=
 =?us-ascii?Q?qfnAwKrnUz6uRjQRUCB7kraGzyEx66Y4XsRC2x3WYJjpuEPJC8FXFOamGyAE?=
 =?us-ascii?Q?0l92Kya8NOwAZFiGFuXE9lBSgfnT5iHEqdg7SaK+yiF88Q8h3Lzl02AAqtSo?=
 =?us-ascii?Q?BrNQln0lJgfQTDbtM7KKkp2ZTCeUU0JjRsSwhMDNMJhWG9bsidaqRkYrwj9O?=
 =?us-ascii?Q?MjHCetRBdzpks1MqGeiJ/8pDlz3zr+I6co91+1/jJgxidn6oqTbTrYhS2n6G?=
 =?us-ascii?Q?MVNso3qE9JVspfLHDhvnpiSzRceoXh6Bu+N/LcPJVbPuQ1gNecYn60qvSI/W?=
 =?us-ascii?Q?9DtzAvHBxqCtI0AjyrvuQscN2xx8NOo1HUSuhStMwkObQndbEJ2FfAd6irg2?=
 =?us-ascii?Q?/NkvABQmHk2CslXy/1O3pCrHpr2kDn+kTCGxMFa/p4+y+RGkG4EiPAPDTp4u?=
 =?us-ascii?Q?3PN+xEB+MCQcvexf+bvFV4E4NHHJSpPOf+P6UXblvw56+nWE1Gz+hNwPAL69?=
 =?us-ascii?Q?oc72PVArmUizcCkhqQLj7elq05fgS4haud+efAE5Dlk4XyOs/jmPechwg2vf?=
 =?us-ascii?Q?PYsdgySWnoD1nzjHvxHViOjjhy0RSfJ7E8VQhmnbkVay0pstBcKPyYXlGecc?=
 =?us-ascii?Q?C0lVlQIT7X5RD/bKATEzUxrbZaWu5kdlfEAhptX9GMUbTj0y5F2GLM7Q9WgE?=
 =?us-ascii?Q?f38vJ36oa6vcbdOGNZI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c563ce1-7cef-4494-503d-08dbda85e915
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 02:54:47.8450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5GZWDpxHUled+GibxOqKMC1lzfkOtZ0UTXEY5QzSWF4dZ6By1lC15kcT4Eh+KZSoUKF85ln2P0oH24MxCdNBYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7825
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, October 31, 2023 3:44 PM
>=20
> On Tue, Oct 31, 2023 at 05:42:29PM +0800, Zhu, Lingshan wrote:
> > > Your answer is not relevant to this discussion at all.
> > > Why?
> > > Because we were discussing the schemes where registers are not used.
> > > One example of that was IMS. It does not matter MSI or MSIX.
> > > As explained in Intel's commit message, the key to focus for IMS is "=
queue
> memory" not some hw register like MSI or MSI-X.
> > you know the device always need to know a address and the data to send
> > a MSI, right?
>=20
> So if virtio is to use IMS then we'll need to add interfaces to program I=
MS, I
> think. As part of that patch - it's reasonable to assume - we will also n=
eed to add
> a way to retrieve IMS so it can be migrated.
>=20
> However, what this example demonstrates is that the approach taken by thi=
s
> proposal to migrate control path structures - namely, by defining a struc=
ture
> used just for migration - means that we will need to come up with a migra=
tion
> interface each time.
> And that is unfortunate.
>
When the device supports a new feature it has supported new functionality.
Hence the live migration side also got updated.
However, the live migration driver does not have to understand what is insi=
de the control path structures.
It is just byte stream.
Only if the hypervisor live migration drive involved in emulating, it will =
parse and that is fine as like other control structures.
=20

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

