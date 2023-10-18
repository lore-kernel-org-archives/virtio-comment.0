Return-Path: <virtio-comment-return-7788-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D27ACDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:28:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EF02A780C7
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:28:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D54D7986895
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:28:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C575198688C; Wed, 18 Oct 2023 06:28:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B6D2298688D
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 06:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lF5Usjd8mPZ/HC7UNZrcnNDYCoDHiwxknil0JGAtxQ86ArPRavXqEpo1hOL2KXLBkVSqLaLyxH4K+GrHza8x9xCX93MGZdFAL2mA5nTMCtLC0+kp/MqqSPO0ktoXBsjB5MIu6VqgfQJGme1UNOF9e+2sBYP9o6kxI2egLAaRDUbn6IQ+47GrpeNKLp4IazUQpPN32S9Z3dSEKQWYSKjMHTRQXh4PXr4wAmYQyjyajCeJ4YzzMzdFehVsh5ahC6VMxPkOg3Cn2I+B897992UC7y90ixdfdeAR9Zf4eD0WYzvJP++sshl51p/KCAOflFw2l17hChr5ydiHBGocYhGdgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiDL/o2mbrDO3S4eO7/5PSAOwuGO7/TF2BoG7GePBl8=;
 b=FhLofo0ec52bEUFSMD2G541oUX0xh1Vrz+sB/S13vQAkYGPwiuuYBz9TSLuLRZVDcTeqS6Dt6/HVj00ckTPPUWSnt60BU0ESbnHCTmxuLb1jr9chZi8ffTvmFnG/5DpIpgC7In8l/rG7a9nrmAGo0OeZbWEBPOghOSwY8u0E/nQPTNylJrrTJGlJppMPwq5zzQ6pTyjMNp8yKTmncnG6ZAPh9/sM5Isj81me30INuNJy0U5mMHvFi5gpYJvqeI+N7cIuV871ZDMq813Iyg/9voufIp+fdt2HlgHygTAVi8AMi9+VWkitc8s8eABpWqoah7QBMHgLKO3O5iJI87ilmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Jason Wang
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAFjqAgAABzyA=
Date: Wed, 18 Oct 2023 06:28:19 +0000
Message-ID:
 <PH0PR12MB54812ECDCF2F4D2DC95395D7DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
 <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018021541-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231018021541-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB9026:EE_
x-ms-office365-filtering-correlation-id: 526268d3-f35e-43b8-43c0-08dbcfa36b6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jzBhy86E52yZ8qJAKdCZIn25ANiO6IETIjIKqLJ1HoiZrpE1orvMoS+9RpCQFbo+v/ZJwJmdlXMLqoAL9IEbLoYyjMb/CDRHc0XKxLPOrED5brCM9uzL+inMoKzcPtXxJv3Gy7Mu5/uUzTA9gunL6HpNTOyDH3ZnBJPfLnwyh4UcbHrLE1h5zMaKMHsrE5WQA7iGMJ16RxHixr85i1OrJwBQCU0aXe8R9n83MYBtmxAnhj0h8ff7Algh9qmeCjGaH7osqh1l7mMq1zZbdRQYmW9fzu4y2k7CSovdrHXNt3GnB//ib8LL9bBn+HXKye0G08+e4xnel8W29NOGlAMVwjwOlzBPXHBrsYCPtZKR8qWdGG2yMhaRyslcppUC8vDKXoa4ciKrnZfcBUrTyBKqLXJgWNI1A4UaVzEmakcay8yEET+xR5lmis9KL3oKbPh9x2UwFx4kJhy+1SvBS58rVOciXCC10oRRi+AJsj905evSULxmJYYAGWdalrqSrsjKRVMLz6asx1qlME3z+ti3r+3ay2wnJGMd3aH09MKCwxcCdVlqRHO6pMzG5/Vgf480FoQmK5dkP1pXHEOd9YzXyUZtmZscLIOJzfGOJrqjIoZq1QiHlGbsaUZiLuZJgz6W
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6506007)(2906002)(52536014)(5660300002)(4326008)(8676002)(8936002)(7696005)(41300700001)(26005)(66476007)(64756008)(66446008)(54906003)(76116006)(66946007)(66556008)(6916009)(316002)(55016003)(478600001)(9686003)(71200400001)(38100700002)(107886003)(83380400001)(38070700005)(122000001)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UgFfgmhdHz5PLy5xx0qq0ctSMQX2qWPx6ZqVI7hATIDVF6KKP7QOPNg5c9zG?=
 =?us-ascii?Q?y6E5DQflq4TgLW2puWhPUBZ+wM728gi4Udidu1l33E3Ys6JYrosiM81Ee9uQ?=
 =?us-ascii?Q?05gzIBwKVcaHUlQ800EmC1DUNo5nK9XWOgvslOwcSQ+CnrjQNQiMTrmdIU18?=
 =?us-ascii?Q?wKD7KBFiyH5u6kbQpQX4mIAkP7mBjQ0cJK3HuuboOQFbVnpsaTngZ1S+Yo6V?=
 =?us-ascii?Q?oLjg78nJIs1u2QAXEeWcF9/sv4lCA1szgG9+M/5Jadq/2BkdFFx7Cokqqffd?=
 =?us-ascii?Q?D0IbZct6VCQ0MhMgw2RC4P/Y5LxqqQvBQ+HToAW6SYzl2vYYaw9NRgjUjERT?=
 =?us-ascii?Q?mDxYk5GG+GEv/gA5/1QGzPCoQOnUcb/82CyTaDuBU0NA9VbNfeGv56RkG07Y?=
 =?us-ascii?Q?eCTGBTtXksbukS9atiDCkNYlF1Y0WmMxyD88PyFmZ390athXpupGqWXDpj6h?=
 =?us-ascii?Q?pFxFxaSiQn7uYagAWpFBVI9K1oVF03hCuB8bzzRhmUdlR8fKIsjGI0T2xk5Y?=
 =?us-ascii?Q?LpofAB1EHUwd38sk1ZqteryiKtxYahPd2VA/e9y3kEexF1ucch45nVTbmc1+?=
 =?us-ascii?Q?bg7Fud2O67737KHpm5gAL4krkS7ic830tvBDKyWkx9QIXRFn0kzzkuHM0f/G?=
 =?us-ascii?Q?EDclNyPRvFHUoveo677LKxPiMtzvP76AcIPDj2VrE9Znar9YdyxUinTag43z?=
 =?us-ascii?Q?l0jEMJwFFPJqINq/DWwenfvhZRFMYT838Z0ABY4GHsBAU+cG7TSUKKvJqVrB?=
 =?us-ascii?Q?V4H/axCz9yPFivH8A1TzR59mgjjGTwKyASQRRmSz01qQhs+eeiYlXEWxHBjH?=
 =?us-ascii?Q?1q7Defn9iHjxeoLUtvoOIFXpedNGTIDJGwcsxt2lp58+L6VfNxbs3pI44oiv?=
 =?us-ascii?Q?Q4FFqoliEqEMY6Sfbxn0Kls5CtOjqEn8rmAt5x7mFxWTVFN0rlrMd6CEm85n?=
 =?us-ascii?Q?QbW4I4kUGdZKzX9wR+eqKxEO6yEhw+sOypTHw83/eo1ndsWEqB1eP4fkHUm/?=
 =?us-ascii?Q?7yVO5VHq/LWDYJMVCzmJPYMXW4l11MXMumi+lquL62lK1ZPQwUm/1zmLtU0/?=
 =?us-ascii?Q?cZS4J8HngC2MDWz6d1DWV2IQyyBIwQfEFL3g+Q4SIGRLgyGAfKYnYbTjYzq2?=
 =?us-ascii?Q?qRJxvd35TwX5bKGrpwd57KmAYvJI9jjgS7MKzlwSjQw3cnghpbenQbIQ0wUQ?=
 =?us-ascii?Q?jbReVy6YTyh7s5dA269H8OYqWuBOpIw/eqVC7lKX48eMBudWQYTfGADuhD7/?=
 =?us-ascii?Q?L3B78OSJoibmrj8GO3bYlSiWWWXr/A20JVx/ibyJjUl/nB4d6g4jJTu3f+Cg?=
 =?us-ascii?Q?P+A71yiwRIWR3WPDNoUHuKiq9AlYMtPopFhx2pda4/jsa25LRazAN8l+o4kF?=
 =?us-ascii?Q?vlKeW0v6bpc1RXs5ElYbNSIBdyY7RhPahFxNVbHuQzAc+Jitve/Hy6ZlIGZM?=
 =?us-ascii?Q?x4upkuQfyta7kzlAq7m1E8YKh9EeEBKy/JXbzlBobRG6DG1H0sVTdk0jKrOZ?=
 =?us-ascii?Q?nN5t0M9aei+a4IwiZS9Gl27ecaqgGjI8JuQqQRieW0fdJBlJDrfzt2vGJVyo?=
 =?us-ascii?Q?Q2Njj/vlffmCx733m5w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526268d3-f35e-43b8-43c0-08dbcfa36b6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 06:28:19.1456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WB+Bmf9YfPfV6KjlMq9+q98SXoqDFpG+v8bLzgSl7bReI3afIK+CbM2W3Sh2t8oqAoJlKQY+qAUcq+cXLlrYIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9026
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, October 18, 2023 11:50 AM
>=20
> On Wed, Oct 18, 2023 at 05:02:25AM +0000, Parav Pandit wrote:
> > > Please just show me your patch resolving these opens, how about
> > > start from defining virito-fs device context and your management VF?
> > As answered, device context infrastructure is done, per device specific=
 device-
> context will be defined incrementally.
> > I will not be including virtio-fs in this series. It will be done
> > incrementally in future utilizing the infrastructure build in this
> > series.
>=20
> virtio fs has a lot of context :) I think we do need some way to document=
 which
> devices do and which don't support migration.  Maybe for each device type
> where it's not defined yet, we should add text along the lines of "Device=
 context
> TBD. Devices of this type SHOULD NOT support
> VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET and
> VIRTIO_ADMIN_CMD_DEV_CTX_READ commands".
It is really hard to comprehend and conclude that device Foo will not be ab=
le to migrate when the device migration work has just began two months ago.
So I wont go overboard to stop them now.

But the requirement you listed about for the commands is covered in the dev=
ice requirements section in patch_5.

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

