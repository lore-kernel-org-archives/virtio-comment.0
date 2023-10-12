Return-Path: <virtio-comment-return-7677-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E619BCDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:13:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 48681A7E4B
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:13:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E98A986837
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:13:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1B457986474; Thu, 12 Oct 2023 10:13:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0D13698660E
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 10:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2CSib488uTUTG1kGHtAiZ2xxcZbJb2nVy/2iKW/BhgeNFgPybzpsFqdImJEmb2pCKjXbDeqwPxEiwjzeuhNckdApXV58BaD/XxvJ4tRuIqvthmQZHZsD50ytrCiL0L/A9lqLfbFWsQVnWeiIvSvWymU9H55k0wXEhoqh5Y2Y2f24oYYcvAw/7E9pf+anqHyjdNXCf+ZeziM1bnOCcnMR2eVhc2UMdlqA0H7K+uUe6gkN3V/MUlHQXmXId24iRYVXYOTFaDl32vBSWybPoxpVHyuM1k4emGrVPlGLdSpsblDHX9SVCG8NMJrj6S1cPB0/4lfiPEQ98yqmuRFB+fhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FitDjhGruZNs0dEMvbiFxLzkRK5WiHkL6Kw6NLABk/o=;
 b=WrG1GxATUDQgvUJaR/zHRi+s6V+HMjDAVHjZ98st4e8o3+I2BtYJKLREvIZBQIAkBUpp00gmsIwcBvU5Aiqr0fpW01yNLjRNBvj1j72oCH/hSnHZIppuH6Gug4OiO5dV+lfXYXwBq6BEqRS+yvD1S7VZxjQy1qcSe0qEvNuunk6h8wMmV1nyj4C/mn1zOkTDKn2vinTGirlq77mQpfVUGrxmPJhgTMZ+jfTH34i3p7aNT1w9SxCiLHb9dq6TIKyd3eInd/ygvoTPd/qfip6gx/8eDCU8YMBUxLbNaGXE+IUJ/vbC7FP6NPPjnv1TVqK1x4EaoADmt9Lp1pZ2k2Zb3w==
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
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAAG6AIAAAQpw
Date: Thu, 12 Oct 2023 10:13:44 +0000
Message-ID:
 <PH0PR12MB54810A5078182638362053F3DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <20231012060413-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231012060413-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5946:EE_
x-ms-office365-filtering-correlation-id: a75fd5c4-e1c7-4c3e-367e-08dbcb0bea68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 47E7gmfCIalZnEizsSCmmRfufa+5HcI6gbpOZIE3eP+4MZeOZAPKG+w4fonTRk67HEje/7ePxpzeC7wVfOKFsfIy8XQQGdYOi/WGByNCLCcHVbCqvqj6ped1G5aJXA8anWHGR7757JCqoWNpoxN3O/wjeh+KLAhcZ2e+ml+k1MQM/xg3SQ5WRg2PL4a3KeP6XkonrpXYXYKq//zm6J8xomOk/tHFeyNXKNFHRUtZ2m9EKHdpM7tcbwjg16tyyM6GXvM7lZThlcp8p0sgvDPsxQhgLzgd9QWqF1g7bsLLeyz0ZH/l7dxtqO63qq/7/KazyLX8Xc4FCHOBpqRUp4x1gS+uKvkbO92cX26rSwiHvNwZd1by/LwLC2hMGLuUjSCDT/fFYfOt7MJEAZEBafXQZnsWPb+F7smhwQpluQBNqlXo8rOnzyRcila/T00DK2i5FYW8MUVZ1nPC6EIsUtddxzWvPEwqiEZ8UPB3Pw04rMsHrr+i536yQvo8DHkqW1VuHqWcVoT/qdVJ/T+tW2Gc7N+WhxTKAg9bSe9Pak9CRi3FEPQaGcnG8j34+8qNO9xejT7jVrnOij6w+3GTvYj5WJIfhTYFK5wPt06uFFYVmCT3sx4dubOnmdmrHrfk6dRi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(136003)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(55016003)(9686003)(107886003)(7696005)(6506007)(478600001)(71200400001)(26005)(2906002)(4744005)(83380400001)(41300700001)(66556008)(5660300002)(110136005)(66476007)(54906003)(64756008)(76116006)(66946007)(66446008)(8676002)(8936002)(4326008)(52536014)(316002)(38100700002)(38070700005)(122000001)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PwMMPgSR6+CGv5FWdTnQF0oO2tIwqdOEJc3PlFV/kbrZTWE73joDMT6QoufB?=
 =?us-ascii?Q?+IHaXb3VuqM3UKKN3yVaDCFT8GKQAboKe4Qsfq+y+EkVg7bacW2O1aHZR32z?=
 =?us-ascii?Q?El5Wn23WoBcYPzuWvEssT3p63il+KX0PfkC9l9h0I3RYk7N7RRPSn01qlfuZ?=
 =?us-ascii?Q?EFklEQhxtCrXaFWp9CMOBogxB41UOVH+6mS/BXFZuvhXnk5/OJgPQWUc1EV6?=
 =?us-ascii?Q?l08NtEkJbO79FPvPn4S76428WTQNUYAemxLdpaLpZ2XD5XySSgTzkDM9R1a0?=
 =?us-ascii?Q?uOKR63FpDJMZ2XadNKV7PgRbmHvxZdBfNQPXRM5RjtISRJfQGngNlsGA5k8Z?=
 =?us-ascii?Q?qTW/3bU4nNUAw2akpe2ELJRm3egsQVtPQuYgHa9ZueGth99dtU1DgWbv1vyn?=
 =?us-ascii?Q?y1HX+/l26wSq4GJgrwwZMkyj00rexsBKV1N6UTNT2c/owhyGJYriFsXfY2lt?=
 =?us-ascii?Q?rddFkoeZiV4xcXGFhFiRu+qvThQN3ySwV63HKq43/1A2nuZkAKUii6sBcoX0?=
 =?us-ascii?Q?wSFW3Rp0AhcrRUDnC9x07kd50GT+NiYSlzAYz0rxKobV6aAMPvNyZ1vOczub?=
 =?us-ascii?Q?08Eo3rZrOtxkugoeDbeT0G0b9y+zUkfoKvm2NkdYzXfQqtrMnFUtWIAle1t2?=
 =?us-ascii?Q?GfAnM3z7IV5JRdtbUQRMJtmFbLpmNhX1GifwLYJjZz6iU6jkQOM+dTpSmWE1?=
 =?us-ascii?Q?M+M8pM8ecE7Tucn6Szh18HSda9GOwOt4QXdIeFmMkEfZaErAPADRyzY+7kNT?=
 =?us-ascii?Q?SuZTWqux82Ocj9WatRA/CQ2mzzsG6BiQphZ/lnNvV4z+oP0z7WrQGVtna/dF?=
 =?us-ascii?Q?x/uHShWH/0x2ds4D5Nz/ZWqHcPnqqiWniCShZ1Tn5HSltEZhWpvZ3jXpPjAH?=
 =?us-ascii?Q?fGEOuHpnvEBtTO2973o8Lp/vl0/cx6AcaVPWJkmqaALLktprsKjZTlt4fw8V?=
 =?us-ascii?Q?lKfJ9aGa7GIyAKjkxhwDuIqXQgyzmr9izvDmZ9O6No1CH0Tn4bwdHISJgX2D?=
 =?us-ascii?Q?+rYb6OPXTmYHHhe6pcV6MtOZDHAnnugVQXScqgvCF7pa5LaXVI1lXpsVJ1rM?=
 =?us-ascii?Q?d66W6rB8zZdFeNY2+65n80feybJ2Y3faupRVkG5La+bg65BtaDBoSQwBOSKR?=
 =?us-ascii?Q?6kKBCDF31ue0sqj/MMuo24Agio/u58ZiUHgk4/IQIUZExHkxyRPFLETEdiUr?=
 =?us-ascii?Q?bxx0Ed4lNGBdTBTFu/nhOyLJLyRLiEplxTDLPHh/EZfd1PSeXtAtH7AspLbU?=
 =?us-ascii?Q?PbdELD08RbT/I5b0efFQec2Kf3055+W/FHRkctsVG3I7Bntw/gFhFsBhg9n6?=
 =?us-ascii?Q?X3UdrQsRxTqOkJy8jyBHK2yaxpOeZRIUBaKrzGBrz05GRhr+l5A097ojcw+Z?=
 =?us-ascii?Q?g7KKRm1gV6WCJJ7wvhgvzRI42wIanl1DyHyUqdEJoYLeGBZrLz6TswFjwHo+?=
 =?us-ascii?Q?YNOpjkfgr0+BxDVZ54TQYyAa5WGgM7brvcMBAQTP8j8OttD8fqgBGAk3yju0?=
 =?us-ascii?Q?JFudxIKCIAawboXyAowZgyuUkIPgyAuQUXD1JOIrSQwmU+N1HGIYRf7uaLkD?=
 =?us-ascii?Q?7rlztw/oVIntFu6HZ+k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75fd5c4-e1c7-4c3e-367e-08dbcb0bea68
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 10:13:44.0326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FHLzs/vOqPfpQLXow6RPy8alVOBgeYDl995+Rf6TeYrStJJIiPI5TMHv2WNsmEVUc4Z6cWeH1k1QUxFt5H4JrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5946
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 12, 2023 3:36 PM
>=20
> On Thu, Oct 12, 2023 at 06:00:09PM +0800, Zhu, Lingshan wrote:
> > we are talking about nested, don't break nested
>=20
> Yes, and I agree a "simulated VF" is a kind of hack at least for now. Wha=
t I could
> see instead is one or both of
> 1 another way to submit admin commands without DMA
> 2 a way to have a "dummy" PF that only does admin
>   commands without anything device specific

Yes. both the methods make send to me.
But I think, it will still do the DMA at the end for device context, dirty =
page addresses.
I was imagining, AQ on the VF itself to do some of these commands, that way=
 both methods can utilize common framework.

Another VF exposed as the dummy PF should work fine maintaining most semant=
ics.


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

