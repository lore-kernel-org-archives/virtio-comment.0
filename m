Return-Path: <virtio-comment-return-6699-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09389EB64DA
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Jul 2023 13:15:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 32E072A887
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Jul 2023 13:15:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1504B9865F6
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Jul 2023 13:15:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 00BB7986593; Tue,  4 Jul 2023 13:15:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E1D6E986595
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Jul 2023 13:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMimLYsv5KXoQ26x/xKqx5zIvcN6VKRwzzbJpa5X/Kvkxtb3jHfc1S8ClVeWaG/wVmda+k9duFYs7OZ0fBZ+N1TlxfztegFfNk9bb65V4gy5sR+9WxWfxlMsHMHz/qKDdd8y6tmBBK1COv3sTad1bDJ4CibkUAP870a+cGQ147v4trpMsuD00DaO1PoUtwG+Z6UtK8PotT9U+IfxXxiXWkA8xprsRgo7/uUEQcwgVHF11Jjg4uq4c5Avs0tHmK4NN/zXED8aXrHFCEvPxsFHxKRDUJ+DOphY9W16fhvZkADc9m7prL7jMlmHRrkyd5sDRvdETuu0CX95hix5YQ521w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSXNUKPNEVdtXb1joFmTwlfTnz+wFu2lI9rhjMoXEGo=;
 b=ayx+QXpJD2nYRsEJhh9L8aiMU6rvgn7DIFUxV3OjJzIBchRDmDh+ubWOUktH8ynARiXs68wrC7no8eJdLgvShmPYe4WPYesPhzCAlHxGQPJ7IZL0yweueIUr4F8/oF198zTQVyLLnLW127hdXJDiv2whDNY8eyVDTN8pYsVDKt8z+4+3BhSAnZ9n4ei7yHxrCP1TCJKFcq/OMXtIaUnHZILdi3kA3nGNhi7oQLEWFtdLsVaGZ7qqDD45enMe6oU5gLIBlPILfu/sKWlKpAvdJE/MlcgyTgn6KkniBqAp7ZTBGOd/rkQnZCMXAfZQmMGj+GpwnO7fE8FwwhrwUWFwgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] About the plan of Admin Queue
Thread-Index:
 AQHZo0OgMaVHGskGLUio/ZFR6jh2f6+TVwYAgA+RFwCABNz3AIAAAtoAgABPh4CAAYQYgIAAEItw
Date: Tue, 4 Jul 2023 13:15:23 +0000
Message-ID:
 <PH0PR12MB5481F6EA4699382DB041A880DC2EA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEtNPGneB0E1sVqmpe9fGwMp=_2vmepy3Bm9r=5=5r=ZXQ@mail.gmail.com>
 <1688372430.0519888-1-xuanzhuo@linux.alibaba.com>
 <20230703071106-mutt-send-email-mst@kernel.org>
 <1688472851.555355-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1688472851.555355-2-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB8072:EE_
x-ms-office365-filtering-correlation-id: 89cffd3d-fc57-46b2-9775-08db7c90b9e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 e6GePzJQxukQelvMNKMJeu7ruXKtsyogM/XHrKHqt2NVGlLkX2CZsbhC3sY1Qr3vuLLTg1QpybrNQIeWHBi0GjgmN0ZYKnm271/b1CHvon3h2UOyjJif1YePmvnkS+joFd4bLyyKFRadIbNIS9EzkpSZJ4F3dANda5ekZkMCtbO8+xtXNHBmqSnaHshx2EQvcq8rY0K9K8jcZNSW1VHkSi0b3OKz9N8GgtmRjyVE/H0gBKWE5fDwIaiaQUWJC0+UnP9b6C6w1wYGyOQ1ivG712dpAoDg+nBafuT3O75heXxKMZL65BCYy51Stn8ede1wQV+8h7E2ZQNyAOWPfqa/B0D6gCRTO9sGXV2mqQCeWfsljEskmzli5h5r/aVO7zvEncV3mlHC2giaINJS1OMJGXNOTtiCP4jlaRLbCHunWhWg3Pq8u4IFbBYjnw2rTK9DxLg/9nHa2QnyJi/GhUXjVjrDE3BHaG11CxU8tNSA7JCwUp3ZE+ipTQv9FIKw7EvBM99nU5KW9F2cxuhDCvgltM8nRxCYFgHUo0fA+5D+a/jLyKIDYooL725vpi6DU8BNNSf7eHpW7gxuQPgdYIsSJpCawzmDU/5Zq6IJFwyINtrUBVPuPgI0FxZLJtzv2aPQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199021)(33656002)(64756008)(4326008)(66476007)(76116006)(66946007)(2906002)(478600001)(66446008)(316002)(66556008)(8936002)(8676002)(52536014)(5660300002)(41300700001)(55016003)(9686003)(86362001)(54906003)(110136005)(38070700005)(4744005)(38100700002)(7696005)(6506007)(122000001)(186003)(83380400001)(26005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?InyNeBG2Tc2IK74xFPXQgBw36qZIUm57WsQQ9dLsZh3yWO1iLdQvppsXXjUf?=
 =?us-ascii?Q?fN+KGFglcMgoqkrB4MicwziSJgE5DFhvUyeOqS7u4hOla5TouEx171CMohBR?=
 =?us-ascii?Q?j1r68k6WZzvpLT7JUn74HdVx7/lEhe4yxSNoPtIIj0IW61jhKff/ulj4cI8m?=
 =?us-ascii?Q?6iB86nU94A9D12Pw9WMXoKPEFrrf8LNGbjAp4frsEMBEx4k07SOubGJxkNqi?=
 =?us-ascii?Q?9beol3bBurdPT1u6qlTPZQVUpgzsMFoeIb3G7lNodEIr5sunEvgEUCT29i5o?=
 =?us-ascii?Q?Z7VJhBjwIB2OiPnN7fBTtq1mAvLGJwMcFCplNE4uYeaGBmgJEOCu4VgUl05d?=
 =?us-ascii?Q?FUdee1OlqydsSxIc0HxS/cQlvc2SWkhHvlco/hK3GHc22FYzpe04jw4bn9Tq?=
 =?us-ascii?Q?AlJcEhm9sQlV3QeA/ffJsBxXid2g8BfqOFTyJta9eSSVEn5QJ0wtkPQq4q6T?=
 =?us-ascii?Q?5VsUayVP/tHGGwciBJ3D4b14McSbt3sD+8wWWjGjG2AbxQmQC/YblJ7TGTHG?=
 =?us-ascii?Q?xFV9N69NKnqgDg9j8tfvTiN/mI3lWEieq2YMnvSM9lgbT5uMyDGnb/WIE9Fq?=
 =?us-ascii?Q?x/PedOTOMb4Xg+Rvd8aVLgWILwqc6d73ok1IV8VlVDsgcB07+owGPbWaQeiu?=
 =?us-ascii?Q?BUi4JOI+5fRDJXT7bdk4ELrqOv519PGpzfeeA2tZKZHhDCAQBbJ9NgjdlK33?=
 =?us-ascii?Q?6smeES+Zd5/1MMC7q6SqhcmJl7zruZe+XwFbUGQVm3r4jod5uq6zSEh6a3nq?=
 =?us-ascii?Q?LGN6I4chuI3OEDv8848oJ9d3DW/V0pPTc36+dxrgQ7HpeaDhBj/nVxPfWVoj?=
 =?us-ascii?Q?A+g5JA4ZgHkZd8AaC68Y4pYVkrgnmk5bsdYFGYGnbssIJjHwIzmqw9Y+DV4T?=
 =?us-ascii?Q?VNiP1jtJUUvn0m3XVZFKqbXhW7rf9kGqd4JWLWYgcHe1BzRpG/0I68SVMmus?=
 =?us-ascii?Q?D0CAyVXivO/FfGIzehAn8LIzVNbrN2k5cly9vkvZI3VZaFI5+PEbBd8Fir+x?=
 =?us-ascii?Q?wlSnblKVr6+lUZYqRf2eS863FubE1QzH7gKoWEyqoStzqEI45SowKqUnAMtL?=
 =?us-ascii?Q?D1TRWzv7T3oXzMpeF6W/TQjccSffnr50YSLyvBiSCnawRGxNt2cG6n1fr/5F?=
 =?us-ascii?Q?ZFKTUCZMS0DnYIdbEE7h8he7Ju330IaOAwvXhoirB+AmS7b9/mUTsPZq1tnk?=
 =?us-ascii?Q?5Xd/eXTkTyoLnV3jVZLQ0ANY1WVW4EruHD2Wp+ebiF1BJoJncBeW7rb/LNXI?=
 =?us-ascii?Q?Lfps1222rXVvVyJj2xEZkiNijq5lfu24UcXNd1Hva02oxBR4ImWgWOg8m5E/?=
 =?us-ascii?Q?471GVcgIXWJa7W4kFZ2KpCqWarmSOh+WZ7JPp3CEFgsiQr7vKWql+yiHB930?=
 =?us-ascii?Q?Dx3zPeRWdj8pOEO6l+EcAWrKQ1C7JWeFWZP6NXOtwdc44D20YZkpZK6tH6BV?=
 =?us-ascii?Q?B439DK9WGRShj+pGAU9qsl81EO8PFZpUC9DlAjm0pPeWx+Apo2BZwd2eqq+v?=
 =?us-ascii?Q?N6Mud+EQP0jwmoSbjAVkAamj/HBaX8GpSflUmovJ8yNl+RX/1kJ56Q5EAFbO?=
 =?us-ascii?Q?SchEI0Ru+1nFB0z+ii0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cffd3d-fc57-46b2-9775-08db7c90b9e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 13:15:23.8678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v67u08saAT445t3iqUVD1/bO3gSxMAIVsyCArWmjAlA2qIjPZpqpd5sb47h8WUdJ/wSURgIOD5Lf+iOgeMxsUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8072
Subject: RE: [virtio-comment] About the plan of Admin Queue


> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Tuesday, July 4, 2023 8:14 AM

> But in the scenario I mentioned, the vendor's management software runs on
> the DPU, and all hosts belong to the user.
>
How did vendor management software configure the parameters on the src side=
?
Same channel can be used on destination side, right?
=20
> The problem we want to solve is that this user may want 1000 network card=
s. So
> it must use VFs as a network cards. It cannot and will not configure deta=
iled NIC
> properties based on the admin queue.
>=20
Sure.
It will not.
The idea is to use same out of band channel as what is used on the src side=
, also on the destination side.

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

