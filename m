Return-Path: <virtio-comment-return-7986-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478B3C25B6B
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:45:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 879272AD75
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:45:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6AD47986A5B
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:45:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 52ABA986A56; Thu, 26 Oct 2023 09:45:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42CDF986A57
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 09:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOpgaXUX3bBso7khdmJHs35v5rI1WmtKAe0K1+1MeZc8gQl0PJ/FVU/Uq9iTXuMMgWxVNpvnzyjIG7JHbbIsi1lkP2n177ql0MwsVF0GmoXrhSnd/X6hcgSviECfH/Ay6SmhXK0T908HN/Kcufe4E6tPQFB4xCnDIjUONw1Gtw4oFAA28sILVj7hxFq+GVncHqtLKXk4J6l5ZgXv2e/4vZRUqvyG+xfNfO9pPgdpq3VcKgfCiwYtKQUGbmycfrgDD6PtO3hWlNjb1zCij3J03BV+Zq2uekWqOy7Czp3ZeAp1Y1Fg5qq1ULabVzDSmMjgFP1FS4q0QY3NUP63IVJfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVX17sowiHLKALmNUrSKMF5GKt50ig+vQQIUdHuqWds=;
 b=Ybjkml/314gGJ5pWPq7NZRWeds8fa0QPxG1px7q27Cvd9wTBI5BhpZANhEbopogn0W2SI5+z9EiZ2r0LrjsTkk4drywek+VmhD+LHDvfpEE5UotndsN/WHh5ldMB1uTvcGnyDHKhsC9NVn+EWJxkQMczOi1nd5cseYH/VYxXixWIWiH4gzOXamJfP2JgvdvhgWrpkSWZ8otRp8pvsqlaGO3XYpKWFQmAWuUCz0c2gSbwZnHsnUQiptdrp+KU14QAPFbUHHg/jfp1W8j0Hb4qjNk6mJXmvCuaXpZ2n+y90bLPNv0uDlbS80Wxa89srIDgb7eqHSng8t+AyxLR1uIlhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>, Cornelia Huck
	<cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IIAAA0oAgAADzbCAAss+gIAACFOAgAEc2TCAACXpgIAAAYlggAAtfgCAAACsgIAADLCAgAAB9BCAAAFbgIAAA0OA
Date: Thu, 26 Oct 2023 09:45:21 +0000
Message-ID:
 <PH0PR12MB5481F967B7040B19272D1253DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
 <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026051240-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548176388094EBC243F879DBDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026052637-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231026052637-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY5PR12MB6550:EE_
x-ms-office365-filtering-correlation-id: c2bc3c58-bc61-4e5a-8f5e-08dbd6084560
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 JhxIXN7IhtZbuDb8djAXmZ84tJgKX5t9JVcV0osuyRmXrCApcAnWzfK5RMAgLicIlfESjNgGJRA+K4s2nBtORK4aiKQI4lqTrn5ptvwabIMl5pfvThjQXrgbJX1jNXZSDjrBAtJTSElvFkVQiXk7ERoAfBnVwm4MZZ0uKVCrbiXBBmwaDdUo+tNiiHMo8AIqdAa9Q7rfICW+X2t1gM7LhfpEB/T1EzbPBb2LstMT8aNovqJD10YIMh6cwxy6HgmeiEf/eDati9yFWb0gTJy/EANg9qk1z4lmpE8mENUeD7+2B3FYyF8m40hpRxx1C1nv9z556Wc65F5kiPuPeNzFpDIfBPwDplY88zjqM8KN1Ys1s3gRu06dQ+ZZmbVEuOsSp/Uadeya8/ju5BQsHcrB1BZxtA3B2MdWESZwNzOPQDcBuvlF/8OXSpb3pdqAezNol5D1b95VT9ZZ4ouWmcMSgeioaNML48bL6so5kGxUNx+V889iMPPVkYrmVGrK6ekFsr3UBQvSB07QTFXSlEgJt2KFo5doYKAfzXhCRN9BBJsGlnwEHf0tdAapQH5LVGMfEgG0BhS+gVzVIp33Fm66pNmiMpGitgT5eeeQJm46AflzJVK6ir5dvrgxaBBox4zQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(38070700009)(26005)(55016003)(38100700002)(2906002)(41300700001)(86362001)(52536014)(5660300002)(8676002)(8936002)(33656002)(4326008)(6506007)(107886003)(478600001)(7696005)(66556008)(66446008)(76116006)(6916009)(316002)(66946007)(54906003)(71200400001)(64756008)(66476007)(83380400001)(9686003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bxSbgZ4kDZX1FT4wMK+tA21nFzQ7NOB2mliSftjB3jDU4JwpVqAfg/TKOtp9?=
 =?us-ascii?Q?zhfcrJc8UWzBZFNpk8o4M1/vM2lTCyxMd8aD+NcYd9Ztch484Ka2cEOA5Ece?=
 =?us-ascii?Q?WjT7Wc9jSEk3d/oydgDZKoN4cx8NyS+6PfpWg5O3KsOlE0pe7WAVxUiIGG9N?=
 =?us-ascii?Q?bRPTNnDER4aG2hwe8Y0qTQPCfnGKCU008nRdzlzufbEoH36YGiV/RoVviAeG?=
 =?us-ascii?Q?Njxh2NW23WkgREud6pFfW8HjVZoqDIB7xQoLmmtBVuU+I1UxjtFX2XC6A70c?=
 =?us-ascii?Q?bFNaoBLt8MV8c7+tVHwVHkaK33Dw4t9rfrpnIbyON518x6VqvJZLsCf4PUMb?=
 =?us-ascii?Q?dooDQV13nsng1dgX+uD8inSedAEDho49fODtfUyw38dcX3kBf/vBpnRBtodE?=
 =?us-ascii?Q?XWRSaENwsCr4cVObUuC+AFSBB53/vZm75wd8FNA7yu8mQwYkQozM9cYhmeOV?=
 =?us-ascii?Q?FnEHkwaEMRZxNu2KEfC2xVDqQ2toLBN/sw0SCMBu10Ru/zHRzG0mZq/Y+M+U?=
 =?us-ascii?Q?1W/xC4EfxBV2ZDSzM5IwW1c/Pjicbue3YeMX1xVxjOk63qbVIhriJFUlimxA?=
 =?us-ascii?Q?AFrlyXFxTaTZzBazEXMNBcqpI9tHXrPupFkxDxT3Qt2vUW/DkBPuUQgIoSAl?=
 =?us-ascii?Q?vVoVfF3fuE8iL/IGGfnZUCyjvcElbgu32Fw8WSUTO6ljfQpuZodxb17AaH8p?=
 =?us-ascii?Q?mvHFU7vQRdKXHH+mUwypEQJ64m9QpVrPSuMl0GK2AAGv3FSciJlxhmfxu5a6?=
 =?us-ascii?Q?TRqX2brnii4krQfc8DvVW6cy3Ra9fhEkSiEENXc4IcAcXFWoadDFH5IiN8NV?=
 =?us-ascii?Q?/befoDvHbasMbtQ3ZxUlq9cUUp2z72Yvtzq0t/r4ukIw79l2NIGrmsL9WdCG?=
 =?us-ascii?Q?+ZWB70tPPScQCNQc+Zm/OAAyTQs7lomfPrju1XLcJs8L+mFXWc6Q05R3Iw/m?=
 =?us-ascii?Q?NCGkzC5j5hs7L6GHP2s1mR6kZDtjO9Zvv5ooE2+nWmbUXcDt7qxGH736Ib1T?=
 =?us-ascii?Q?TAVwVWATC1PVfud7b0g1r7/WqbWPfPQOSgnyZJoa4Uygpi/sj/q6AZC7ZHSi?=
 =?us-ascii?Q?zSLKDcJs0TFS3C3MeDZPa+fPo3LOZkjq1VamkCHHphJPhcowq3X9NtGC7pzh?=
 =?us-ascii?Q?rHgKBBictj42REw/nRVbhfJjIy7XidAKK2qqUsz+wx85cbBw36nQa8fPtR5A?=
 =?us-ascii?Q?b+41Da9I0crnFzl01GA4AL+Qtm5tqhLoLjWwjlTMfeUizkEgFaLQURNgU/ri?=
 =?us-ascii?Q?PgYspIzOA6nImitwRnBbx4SbxYXoF/68vGbNu9zrZwcs0oeVp9LSc+yKcNKX?=
 =?us-ascii?Q?AStv54+VULTxjlmfRaZNZKgvFJkH+xOxeBmazw78Hw1lSkyNGulvcsWY5mHg?=
 =?us-ascii?Q?020nmATtN7fnG0pfoEIHs5dkyF6tfRVC9oSEHgpfKuGhPWU7aCcbzJxEwrfq?=
 =?us-ascii?Q?8ieeIyB/G175MKj14Z/0FVqJ9BBKJtYGeWOWJ4pA6rS3NjO832nZn3OuMzYu?=
 =?us-ascii?Q?pi5TKfOePx2gxf61jQo5k2vkgtL/9aB6jffmuTz/xz6tRa7ZMDDb0ZQ1gUui?=
 =?us-ascii?Q?lPVykXZ95PJ7d5jkpiw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bc3c58-bc61-4e5a-8f5e-08dbd6084560
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 09:45:21.5022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eENqCYqPXVA3YCyFFHziklGW6eVKmlmC40ExY0jH7/r7dBSxueqxETLn37oEjV5/4kZYDivr46QPFShSygDLGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6550
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 26, 2023 2:58 PM
>=20
> On Thu, Oct 26, 2023 at 09:24:06AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, October 26, 2023 2:46 PM
> >
> > > > So, this will still provide the unified approach when/if needed on
> > > > other
> > > devices.
> > >
> > > What do you want to know? Whether dynamically adding/deleting queues
> > > is useful generally? For example, queue per CPU is not uncommon to
> > > avoid need for locks. In the presence of CPU hotplug, the natural
> > > thing to do is to add/delete them.
> > So for those devices who care for such performance, it is reasonable fo=
r them
> to have the cvq providing channel for complex and dynamic commands.
>=20
> Again, let's please not waste time adding this piecemeal to each device t=
ype,
> this is clearly a generic thing that belongs in the core.

Maybe I didn't explain well.

I am proposing a generic way for all device types as following.
1. create cvq as main communication channel for resource create/destroy
2. create resource dynamically using this cvq

These are common commands defined across all device types in basic faciliti=
es section.
Those devices which has cvq, they define how to transport these generic def=
ined commands.
Those devices which do not have cvq, but when they need dynamic resources, =
they will define and create one cvq.
As such devices will likely need more than just dynamic vq creation, for wh=
ich it will need cvq anyway.


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

