Return-Path: <virtio-comment-return-8420-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EDDC197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:44:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C6B27C6113
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:44:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99E09986E25
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:44:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 81A0E986E1A; Fri, 17 Nov 2023 09:44:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 71407986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 09:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwsuHnQJT/5OnshCP2vlMhq3m9Zry9Au4KaN904xNL8NARI7XqMM75NlLiAZomy/mkmiGx4ek3n/v1QSQSc+kfI4zxb7T5Y+tBrCSd+RL0Rv5qopF9KVpi3bVA8WshX/TamDmMdQrhQMnDl/aODayI3uxWbAKgbRgWsWSTXnzYH89u0EoISRRsdGkz1aIWGJqChmUQiR7DoGqr/0iynxuWZruBNouG/julwmD6IhZPcIXanA7so4hNLuHHN5GtBexk79hOG5DftHTcytSGZQtAgaYHMiP3+XmI2JNQcgSqZGkO/mykYLWml3rxH/OyNVCHDz12oXIpvJmy3cgSS1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAFvqv8QEyNHWvfWS16GdAAD4QsSk9ZmOnxiAAC6MDE=;
 b=m96MAuEMZGGGz5Dz8mxzmCEScGhC6EDtal12pBf3iEF0/P7xdpComqwelCv0tx6BUVMNnxrjE5O+RgiVWIoheKmdKhiHbky+tLtYAzreWIXBvhW4fq/KY01Ecq0agpJ0uwCM6CEyd3zxMP84LN3BjP62tzzo0XRyOFlqd9+bAMlDs+xpZLcpC1+OggsG7IJmve87abh762fCLLiwCRK2VGN9G74hZ+cQiWcxx549An0z7/8t049zDqOsy8iDk3/pbjQldgFIjMmCwWAHcyHTChBlzm+mnMn53+YATZVn+JOI7ze84nph3paur5vddTEgTRjfrkgWh/KDRVc+IXCBOw==
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
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCAAGEbgIAAB4aggAAG2gCAAABcQIAAAPig
Date: Fri, 17 Nov 2023 09:44:26 +0000
Message-ID:
 <PH0PR12MB548100F267C791FF43B971EFDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BY5PR12MB4052:EE_
x-ms-office365-filtering-correlation-id: 6274f02b-2e94-428a-e1dc-08dbe751c97d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VRz3QcfoMYqizPJ0CIT+t4ZwGLLDRvAxIAyyfKtZit2h4SY2eY8NtvnItHzrwuEZkk2nt4eFANqbUTMOy0WkKQFytadCIL+uzRQLBlJla55/tJB7KsiGtrzjRAiHvSau+mP1ESRXZXH8rA2++kNp/rxpGzQik2s68w14r/RaYKDwWQPC1Wb2EEYTFYDJF4lIzjD9yQZGSecLUCUqgqdv1N45Z3pCrupVc9+VicJdsnNFg5QbkRhVncQML5WYuAQyL/gYT6uhbt3ymZB1q4dmeBWInZFSi4+nogSMYmqx73PTA8UE8x6oxtevwGbm6lPkzKYkJQ0l+HuHtQAEBzcExfpudgBsPhRRuncayJAFlYPIqasnbHB2bZXs+0XcEHkrgi5CIjyTb7y09H8LDspoh2p3LExcBLA5Oucq3WPy4qS3YwSu+XIwdrPDGQNz7LVhr8BBrpQIrqiQrFZ9GZanWWAZ0RitPctPU7sXIV9xoS1XlY9cb/CCKiMh6bmEckUF4lVIoRmrnjruGK41fJjw8f7KMtVeEYjCqG2qaRv5RjxaaWSYP1avQLS3U8mre3ibe1KxbPWz/MS0C5HNH2jUSsmfinpHfw/rAMGdmDlSBuZxXyD50AHd1glSWWzZmVhx
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(33656002)(71200400001)(7696005)(6506007)(55236004)(55016003)(9686003)(86362001)(478600001)(6916009)(66946007)(66556008)(26005)(316002)(54906003)(66446008)(76116006)(38070700009)(66476007)(64756008)(2940100002)(52536014)(83380400001)(8676002)(4326008)(8936002)(5660300002)(2906002)(41300700001)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?K4fVWJw+eIfiiFIXBHU8wJabJ54JI7mXHlMjTMZGAGdi3HTT4mrUKW342j0E?=
 =?us-ascii?Q?uEXdP2YGmoIwPvoVW+2eiRnA4xOBM8x6qAUoRRs6ljs++C/safYkeO9nTCHo?=
 =?us-ascii?Q?bh88A65MK1lWKhku0IkzVw3LmOfisqYE8z8VJgg0hefcFBhW18/KbIsEGQWw?=
 =?us-ascii?Q?UD9dlLk+LJKGblqHIIqJ3UN+wpGDCBftUjc+nZn7T2SQD0Tr+OUy6TNHzp37?=
 =?us-ascii?Q?UUMH+uWZf+AJajAk68mai8kVo5uEJTuJ59r7IX4GDq4XqSYRXyJhSWbMvaaV?=
 =?us-ascii?Q?Blm0ImLKj97GDJO6A8srVzGrwKKhdBBW0+gUbiORLtqH55q1Olar9TPcv3xS?=
 =?us-ascii?Q?WhjMC7LXnTBfGBz4wQvUZXUrlDIaxYE9eEuWrBT1GbDYTDC6IHpphnjBBGft?=
 =?us-ascii?Q?3gd4jKN8E0cFwsdTC4HhfeYdMWUgWw64+Xok/ijwGQd5+UlwCEBr2399WT2d?=
 =?us-ascii?Q?3/BfDUgIXaBtk4ISEya+wRqeKVEcsk/CwpztzPrgQuzDDkD90z172CD1g9v0?=
 =?us-ascii?Q?gWVA2p20O2fsNRd/yKm/tX48sBb3z75dZMVIH/1n/2a7tPOe2vL6ZsP0wHnn?=
 =?us-ascii?Q?F1xZnEWsMlxNncpGTdKYs/c/7F8zFXUQgAbh/kRQl19k+A3OxOO0BFRp6/0S?=
 =?us-ascii?Q?atYIuap+u/gy0EazgCiNRyX4x7Z8PPTXuTUHlF0fJsgBMQ034sU6J3vUQ8/l?=
 =?us-ascii?Q?/D9Gbe50HYCgGjrsyETkxAdVi/R27Hoxda0h3IsAkapcO/Hr8DPjpNXPBTEe?=
 =?us-ascii?Q?FtZ2a1e+SZq6mqutYtSKvahcsV9IyIKC84BOoumCiVgVtmvpP3jF5cOBTKv6?=
 =?us-ascii?Q?QTElWdG/ZIjFuh7iVjGA8hDqdqq4lsQ03GgZxp663bvrCvsri29e84+4UY0B?=
 =?us-ascii?Q?Oi1s4a/rT3qqcMLLs3kuzaSiWSJ+9lN0A3XBGBo63UZmgIbY23gOAlgPNBb9?=
 =?us-ascii?Q?tytwJITDRLV2By8y+iohK0ml2IoflSuwYHkJqkgv7MdvPZpeXD9S2VxTUFwv?=
 =?us-ascii?Q?6O9xhFvYrcV1N2BCGxwPss30ajTEc8uA2nf6B4NnW7vkqPD9wSrwvremQWMQ?=
 =?us-ascii?Q?NLslwGxm5rOdtFkFeLnkS5GULyTKU0+04FucdoNvIzsm5gqkE5H3vE2zgs04?=
 =?us-ascii?Q?Y996nQTkNrBU6nmUTAhIiya9fu6MKRYssYaNcG/54MypLjBn042SipDoojXx?=
 =?us-ascii?Q?aboZ05fnvR/lNxRx7Ed6C0uKq8cJhUVvRv1OlYY1l2MnRjvf+fuqEi+iif3B?=
 =?us-ascii?Q?gv6HPQJCwVmGisrZnyoJVAcsV5ZLu0eLhv7doiQvzcHklVSdz8jFgbxash63?=
 =?us-ascii?Q?qK86k4pvo/B/AUZ55A9AlAAv8/eJIkRUCsayswfSQBp4QrffoBQhi0Ptg2ad?=
 =?us-ascii?Q?Jg5W9tci4eAPutgc37QKu204g9xp3Ul9MgD+5g6N+EgQXOCFWpfRSS26u9lJ?=
 =?us-ascii?Q?zjXTyjfp6wEP84sCr7sTnMtdGuz8odEMZOr00oFov/aI35IzdJsUXUIJxjEZ?=
 =?us-ascii?Q?EzkjCMMW3oEF2G1ii+iIo30RIHjMUg06hJ2BNR5kRPMbbNoaaopJOhBDjQNw?=
 =?us-ascii?Q?p7K5YDzsbGGJdLo0+mg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6274f02b-2e94-428a-e1dc-08dbe751c97d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 09:44:26.1715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYezL8Zs8t/jsQDhI2vkMMLaCBUtoDj6esF4Lib+i4PLGVVCpG7CW/VSesy+l9ZKrC95eiiwjx5hbpb56DdmRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4052
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands


> From: Parav Pandit <parav@nvidia.com>
> Sent: Friday, November 17, 2023 3:12 PM
>=20
>=20
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 17, 2023 3:08 PM
> >
> > On Fri, Nov 17, 2023 at 09:14:21AM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 17, 2023 2:16 PM In any case you can safely
> > > > assume that many users will have migration that takes seconds and
> > > > minutes.
> > >
> > > Strange, but ok. I don't see any problem with current method.
> > > 8MB is used for very large VM of 1TB takes minutes. Should be fine.
> >
> > The problem is simple: vendors selling devices have no idea how large
> > the VM will be. So you have to over-provision for the max VM size.
> > If there was a way to instead allocate that in host memory, that would
> > improve on this.
>=20
> Not sure what to over provision for max VM size.
> Vendor does not know how many vcpus will be needed. It is no different
> problem.
>=20
> When the VM migration is started, the individual tracking range is suppli=
ed by
> the hypervisor to device.
> Device allocates necessary memory on this instruction.
>=20
> When the VM with certain size is provisioned, the member device can be
> provisioned for the VM size.
> And if it cannot be provisioned, possibly this may not the right member d=
evice
> to use at that point in time.

Clicked little early,
I agree that,
And if the dynamic host memory by the owner device, an extension could be h=
ave request/event queue from the owner device depending on the algorithm an=
d size of VM it runs.


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

