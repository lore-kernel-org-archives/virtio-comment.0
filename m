Return-Path: <virtio-comment-return-8956-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9512DC47077
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 11:23:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D9D76429AC
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 11:23:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A10AF986688
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 11:23:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 89023986591; Tue, 16 Jan 2024 11:23:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 790C09865AA
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Jan 2024 11:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkO/arabIFNA9RwdrTwVC0w79C2KJMGcz7eDeCtvft6Y8h8slp1Zf/Y94dAD1g7ypNFinDvSpykWwPcRhklvzQz4QKDoUlcsgnjOuWPJLSH6Tu9gd+u02u4ZktvKO/XtPj4NWSTjZL/CnMwSKGQZgRIoZR9YPURPXj/tUON634NW0+BSTjBjbvMQ1shMyCnqz78mZ3d5q9o46I5r8UUSzpfQwpnb5g0DT0SjUI8A5RugvXDJdg6eODp1/WIHxX9UbULgzowYizo3AHCzcFd8gGk6cdR8cHhlHAiAQHfWzDmOSVjVe2/e+9fiuef8Y/yxZ2x8lRMppvsCm4gVsb0fsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1mR3eMuwx4/JNVpcOo5SaPr4IV34xLvGEX8U2jmp0I=;
 b=ccwfjpWNB7awDr/+EqF+oHld+rMicR7ShCu9xujLw8+ZGzmD4vW1LXendlkSuK0THupriKIzW5o3VfTsWr3vZUcEJThuQJgmGRs0VJohTD21OPiTCqfq/uxz3F6Eyuem8vFBCzAhbNoPdgHvCPw0B91RCtMwR3h4vovFpH42szOtMCeBrgeKf/O+xKyU/aMNfGvFmrfQ9zPP6oK0J/Yh3Ft/WPdIP15uSJnjp8UO6/Ee6W95hwcujVo6Sq7FIaE5P8WiUL0nMbTU2a/0B7KMs+RqYdQ7jxVLkb5Yy+jOUR75qIbJL9jJo2hEj/IkGwS31cGVmXeHUJFGUwxhpFXcUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "yuri.benditovich@daynix.com"
	<yuri.benditovich@daynix.com>
Thread-Topic: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text
Thread-Index: AQHaR5W52J2qfmVC+UWFja2twvUrIrDbFOyAgAC4IFCAAHrbgIAABXdA
Date: Tue, 16 Jan 2024 11:23:49 +0000
Message-ID:
 <PH0PR12MB54815BB31B88DB812507A8A4DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-2-parav@nvidia.com> <87r0iimtrg.fsf@redhat.com>
 <PH0PR12MB548114CE959557968F5124D9DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87o7dlmtgo.fsf@redhat.com>
In-Reply-To: <87o7dlmtgo.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB8697:EE_
x-ms-office365-filtering-correlation-id: 0fe71c48-3e42-4beb-d657-08dc16859ccf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ll2/w0BTrajuTNaxpAOADQX/JOIbPou6R7pjX2ylTcB89c9vrSytMwa6f+qmOKCkuQELCgewsoQ7y5g0Qbj+Qxhqm9IGAqKJNXjI56SHKouCYavCC2aLRtPuD0ttKg43LPr4P/wocRAiXznLmssyA3nxjJhUo6O3DMBhANNSIwHzTtd6ddBikQEuh7tbH85WzAEHz6e8YvXTAi+9giF9Oq4GlAlzi3PAWGeCaXJj6M8H+7uzgr9atBYkmYkZY81wKpiNULldaHMM/INNrM94Rmod8pcoTvuZuDCFmJ824uyjxZP+Im+P+HHimOiMYJyIlAjZOaP7j2sf6mOw7yc8/o/GYUzVmKMo1EbawfVayhU3L7e39pY6H8VMobMgIeMwD/DaHu1skUje9gi/zDjE0K1xfBl4r91+o9jE9Ea0EqBNbVlNDKm3Zdp98o+mFZSyUBiEshGk6Qhj8dZcZzJu3/ARD1Nq11lku4kKPjjlR5vkTomgcxgCDpudMfCiAPmxnbip1E/XwulbIKhS+nOq+lxYc2JrZC3djugSX3sOL0BHK1sodOgiBxlpccNfJSUDuw0SCK94zVyuMipSfe7/qV9zsvdwVBbErAdFnxn9WHsocFUM627k9vfHJvm5EV69
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(38100700002)(122000001)(26005)(5660300002)(4326008)(8676002)(8936002)(52536014)(41300700001)(2906002)(7696005)(6506007)(71200400001)(478600001)(53546011)(9686003)(76116006)(316002)(66946007)(54906003)(110136005)(64756008)(66446008)(66476007)(66556008)(33656002)(86362001)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iQUCDPxxh8Z8LZBvFgnr7oP7WBsuglUM5xpmL/urf+OfmmgPF6qaFCOZb1x9?=
 =?us-ascii?Q?jfnK7aMtBHDr2CR7nHfAwkDfP5pZty0yhNine5cLjjC8xWoW0e01pf4ER6cZ?=
 =?us-ascii?Q?T2bTv5JzyQXzswl9X4uHJsqCpQoFJ+no00GAyGlH09VZ4cxGmlswToZa81sQ?=
 =?us-ascii?Q?MMkV64BaUwq1kIJbaGfpWFQk39NOhXdJM8giE2HQufcHNowbX24UxvM6K4Vj?=
 =?us-ascii?Q?PIBGQQYOwXDap7/yBZcON0dREH5mgEK7sUPP5HGnPDjhLFGT6WYzliWw7NgW?=
 =?us-ascii?Q?/PFSpNlsmzV+hFPV1poP4NZneUlQ/thc2NIEKLHjMtXRKZxhcGM1wjpFdrZs?=
 =?us-ascii?Q?zfokl/pu0J0500slh2EqS3d45Ip/bUgGcQxroXQQn7bFbE7JQgndXjAhMfoE?=
 =?us-ascii?Q?X+kSQ7hPP9OsdNxd5HbzNpM61AHtw0jlHfboWSeuCBfIQIHc3o3oM9+oQlIY?=
 =?us-ascii?Q?biFJuXJRRuFM5p58zVWI1+ob2Cefqnc3lfzHKCe1wUHTkK6BdVK8/oLkSHko?=
 =?us-ascii?Q?XSq05AbEi+xAX/TMZh4LODcAXQqmQzyiEle50T6IvuDkdnCM9eJ8CWbzeZ6+?=
 =?us-ascii?Q?RzmD5b8GWGPd2gGVhYwYoiNDYe1fgXCuzST5Evl8sOU6NR+naGLhewLgW41T?=
 =?us-ascii?Q?gYzAbmVS1aZLuUucgVe35M5lVj4CwNelRzIQZBVSrrdF0Cx3iCMWVyd023aF?=
 =?us-ascii?Q?E4hw7SS15I7A0jRYrgqb0PpddrkqCS6e65OT2XIj9r5bueci/SwfK5s0FQ53?=
 =?us-ascii?Q?zUlHj9A+Dz1b9l8cMFJ4jsQp3Nlkp5IVf2QkWZ07CAxe0AzQHPsafSBV6vjh?=
 =?us-ascii?Q?MRoumc3TpM1ssCGLbqE+z10b/Xqtq3grvDPiReHS7nfPfStYbzjm7Yev0+Tk?=
 =?us-ascii?Q?MrMOjAKJtgm9HuHJ9UXHnJGkT+5nPrZig9lf+hjWhcgNSZOEwascadSVEEkp?=
 =?us-ascii?Q?MaR/vfxKwIRWdwjwHLvoMGoxNGBC/pIRWYGin6SK0JMQVh4jeHrLLIpHjU3Y?=
 =?us-ascii?Q?kwdWJPtEuLzbFs9ix4U4auJmiEt8Ct2HocoWY863jl7qlq8luotUB9X6FoT1?=
 =?us-ascii?Q?CQUBZulhD/rBZcql30oBDmikBwroYAoc8OTr5Cjodx4+wuiFjckdyglnsvPj?=
 =?us-ascii?Q?DgpFAHC7BMTy0cTFvzuh6WWupXkS7lfs2MjZ1veUMA26nqSPNq0N/dwpCmIi?=
 =?us-ascii?Q?6lr7oYYOoigDk8qrSOcuEXEgQRDNUMT7LGuZ4kjtDdiiAewz+2Dh9kHGfUXW?=
 =?us-ascii?Q?HVVncOyOm9i+OhtkgaHijhUr2WNV6yvw+O6AyueYVtY1zgUROgpHlNIwUDwW?=
 =?us-ascii?Q?cgI8XrWNgqzkj2e01/Wgbui81XgT39F98IcqeLAIGUtZ+v+zzu0IBnZxg0RI?=
 =?us-ascii?Q?8DCDvLNjc3iYKM9btFDsJ0sxkK2IDsaPo3nsu+TlUGvupADzI3amsW+HBb2S?=
 =?us-ascii?Q?C9MBElJyTE5RuZZbJM87I8S2bsOCmW0ql9OIY3ODIxkvlKufQttd7CCsnthJ?=
 =?us-ascii?Q?dr/T3pFuKDNJvVDCMQ+6/m89bnD8aj9QWbvbSsbU+GfL2vtmrZ+tSlp0qUkM?=
 =?us-ascii?Q?Bh9YZjlytO2mDiC3QL0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe71c48-3e42-4beb-d657-08dc16859ccf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 11:23:49.6521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6P1xgtNklaA8kBCLfZVJekHYX1yjpLeLpkqzKP2C6xUW4NN5MC/YiUllBpI/+Fqe3ft10y1nLdD8uC8iAKvKUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8697
Subject: [virtio-comment] RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text


> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Tuesday, January 16, 2024 4:33 PM
> To: Parav Pandit <parav@nvidia.com>; virtio-comment@lists.oasis-open.org;
> mst@redhat.com
> Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
> yuri.benditovich@daynix.com
> Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculati=
on text
>=20
> On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
>=20
> >> From: Cornelia Huck <cohuck@redhat.com>
> >> Sent: Monday, January 15, 2024 10:14 PM
> >
> >> On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:
> >> > +The driver MUST consider size of field \field{struct
> >> > +virtio_net_hdr}
> >> > +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes
> >> > +if
> >> not.
> >> > +
> >>
> >> Requiring the driver to consider the size of something to be its
> >> actual size seems a bit odd :) I don't think we need this, as the
> >> length can be derived from looking at the definitions, and is already
> >> spelled out explicitly, if you consider my suggestion above.
> > We need this because tx side also needs to refer to the virtio_net_hdr =
in
> patch 2 to be same as that of the rx side.
> > And hence, this normative sets base line for tx side too. Relying on re=
st of the
> receive packet normative is not enough.
>=20
> Hm, why? If struct virtio_net_hdr is well-defined, its size is well-defin=
ed as
> well, and we do not need to state it explictly?
Because,=20
the size of virtio_net_hdr is derived from the rx side features.
Today there is no normative line that says that even though you are using A=
, B, C Rx features, due to which your tx side virtio_net_hdr also changes.
The 2nd patch in this series adds this explicit normative as explained in t=
he cover letter.

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

