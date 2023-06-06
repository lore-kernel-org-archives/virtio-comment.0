Return-Path: <virtio-comment-return-6186-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D9AC7EE2F
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:56:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0C03394EE7
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:56:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02B38986603
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:56:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EE19A98657E; Tue,  6 Jun 2023 22:56:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DBBBC986583;
	Tue,  6 Jun 2023 22:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMwNFzZHlZFADdq9Vg8Pw3AAXS3RQJl9JD/gv7Xr6YIab/F9Mmt51iMtgjlM6dPJGtYYAu4cFNdtusye/K+XnA9nkuUu8jSgJLrzq/H8UuVp6JYIn9cyxSt6KsCKFN6hS0hlrq1ivMxDTpkVms77Gt43+Lx74v64Nb1V8RwZfvGcf7qsO3gtW//ufWrfHwfwh1FZpG0segHJdObT1DU2rGtv2fE51KLOmLfWTSquLuEJitzu2OHvFAIvO866lzY01Zh3O/elo9X4hJDHtQkc+B2e8A2WXLAajYp6nVq5eZAZeCb7EjZ9BYXSjU7iIIa4Jh0CRjWWu69xglemDMzHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpdDEEekWTbs4josjI79rLHnRLIIigVmFyIuwpleMK4=;
 b=n4rXJo8KajozXiNeCkrWAp42sOs1zYwnFoDpAhqyJ6hYaqHUha5h0y09ASzOwotLCEYwcfW9iq2y4Jreeixs1qHTiaq7KxaE9PrMfDSpoFoeluwE0x4JiNKA7kL4Aw0A9PlGsE+tsB3vidbuj0Awto2eKAY1kjPr9kuZhhSzSa2gYHQU8zHNCmbb0m35+yhy7eeScXsA035EX65I1tk1YWvQVUSaNUAK2PBS/33J+5PieVfKLdeQy73iIPNpdQDrog4qMyidI2e1tejeGDePDp3CC9vGMSS17Viw5aMJet/MF8C0azWCCOiu7105j95fdlfYbIdkOngLEUl3lTcAFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 0/7] virtio net new
 features requirements
Thread-Index: AQHZlNTogbXhoh8UHEyoUtrHwJbXYq9+aLUAgAAAs8A=
Date: Tue, 6 Jun 2023 22:56:51 +0000
Message-ID:
 <PH0PR12MB5481531282FA61F8D0F66144DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230606184141-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230606184141-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ1PR12MB6147:EE_
x-ms-office365-filtering-correlation-id: 0a68a28d-fc6c-4f5c-f718-08db66e150cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uOu6uytklix1/Ae1jihN0TPo6/z00ea4frRSTnEWtEN/ew8kDcZGg5ftZpf2rO3yznhl/HyX6pKg/T++wgPZzXz7XiNtomUOsO/q2qk0sj+gYikMlYUoLWUdeLIJu/7R3tumSmBfSPNsYKVYgyY5ozYcLTBwxoHwW9WKhKXq/I+KDrgWsFdlOELw5ckYnq1mJCQU+NjEf4VGK33SwMVMl/DnyX+oS70B3hn9hKC3upGveb3FVs10fjrB1duXSMCpmHRctbm7Zebw5GH0sxV/uVjV3J2lioF8gh0PAxF1wcLRANaBOcxlYt2lBb7seFGXhfiPxtbIc4UbdVxxyAaLYMhHYLiAHQ3lAYXZ10YrGSVdJhVsHECwNCdoYz3HcHV3CmZmNZ5MsMLTSCz92NLDRDevtS4o25z3K9A5NVjYRRf8MZnmlBoj39FRHHeBYWbI2z8Bp8IwvFsKb2NpC1aN1eCDJymYJHvofiFIcyBn1O7nPeqLYEUXnJJ1cVGQo/hsPbgefJ8Y1zWEsxN8CGrYyvPtO7nr+InTlSpBatwnI+KkqJo5vdHgZO6u5UNDLUP0JqN+MtCQvIRxHCorpPPReeXyIMfL4O/VnGhpeq1Eieh002cW50idRr/CHrsUhz5g
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(55016003)(316002)(54906003)(478600001)(8676002)(4326008)(66476007)(38100700002)(122000001)(66556008)(66446008)(41300700001)(64756008)(83380400001)(6916009)(8936002)(186003)(7696005)(71200400001)(26005)(9686003)(6506007)(86362001)(5660300002)(38070700005)(52536014)(33656002)(2906002)(66946007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?E17wevqLcdLb45p0+IPFYbsGsWdN4c/R8VzCd1XsdeuGknJEfcrvudNkWajy?=
 =?us-ascii?Q?BsY18L+ppWPAZoA4GiwhIW9T1sib6kfAyUXtkSuDeeYCxU6F/uVl8FLjKtql?=
 =?us-ascii?Q?9T+fNDmKst16S8/oFo2U0VYUq6AkxeNxsnu0cvUwgybw0sbFkGBLbZSwiV5p?=
 =?us-ascii?Q?Kt8bbIG6773oxNW9HyJRaYBdbQHiW6L18VeG14NrXb1tlI7ESj9pldCdPf4D?=
 =?us-ascii?Q?PCSvqm1HC+NskpDCAD86+16z5vvwTiCLqJNa74u4tYaKfmnMuqa0xcFhlf2Z?=
 =?us-ascii?Q?eWJSg8Ucr5MpQ1s4CfHjUeGakjd2JCkRm5LwK5AMmG70iJpFmOr2vkqAmMjU?=
 =?us-ascii?Q?wFrJnTn5vJ0qmJFaWSblLOGr8Q9gyRUImcelPfvJt+hL3HBVyS3zUHrTkOvI?=
 =?us-ascii?Q?6B8FhK93BxqHpqYi//BwnV3tYpvd52KcVplv8Mm+ro50m5xEDsIU6XWupcB3?=
 =?us-ascii?Q?kNvCJ+HayKHWLC8T31hEkRXxjMmMFj5Q6Vzew4/T1tFeMVMEPp5UE/9Uz72/?=
 =?us-ascii?Q?m6I7fSGnreUsfQd87oH756RYRPi2S94uJdMaIwPHqOIzA5TBOPYTA8v27sCq?=
 =?us-ascii?Q?ZSNz2tEFjKXZ7/3cw6/B16OnIlTZ2vxBdbxI51cqiZcvPKHV7568krREPAeH?=
 =?us-ascii?Q?bmTd4dcav6heudaD3tdbh8k5mW3h7e5i5d6mmAsZDOR338Egz4drhei3CBTD?=
 =?us-ascii?Q?VkP5UkduaaPMlw6xi0nbKT9I/HaCho3ovCCu9ptje/jHj5HzJFP00V9gRJo+?=
 =?us-ascii?Q?gz+PO5g6PPYzsi/5V7ToQ+TZy0bQGYst684InZbbG6DxJ05a1sQkLUg2jKRA?=
 =?us-ascii?Q?6V/pRSOPWLXnICesk2HRJd/8IbFrxhugMGs0P6MqKbB2Y9s23/NO2LYy/tbG?=
 =?us-ascii?Q?yhTBc6/N9d11Unevq+baRmDh+hC0F95Fw4qmp1Ou+iit3nFSFTX3XfiokK5M?=
 =?us-ascii?Q?aZ2t064y7tszt8FBJ/JwgRJIOwSHCGxRkZh8PsMwA2qcOXaQxzx2eme5KpGn?=
 =?us-ascii?Q?12msJhvwrkwYyJzgbCXcT9lDrykCO1CU00YBI/DuennY1MIRkpwdB87e4456?=
 =?us-ascii?Q?jbeMC6WrJlMVLDt7kRfOsI1qzhrWMfqJCQXoYb8c5bqRc6miLVpwclrZu7G8?=
 =?us-ascii?Q?E9eEp6Nty/PHGVGvtHvbKSbuuKJJURItZUfuuZtRkE4Sfl7JyZt4Y2h39Wdm?=
 =?us-ascii?Q?Vbzvkheg8U3XNvjYkI3SOk+yE41YVijki6i3RosXVsxlWsL5TZAH4/epdq4r?=
 =?us-ascii?Q?l+/PIvaP+ht1SLiVALP6SOivab/pFmEfqjaVbI6bx4ts1eerwHIoQqBCZNOC?=
 =?us-ascii?Q?EF9EJPrVLs8DSt+bBXJVNaRukz/0SmMIIFHDJ/JgdMa7mJqCqD/0JrTgqBjV?=
 =?us-ascii?Q?LlOfbbXHxqkPxNADx69thrsatecrLDk5nAfAwmGiDcDFscDmdXlQUZUj3i4O?=
 =?us-ascii?Q?zX7gB7mGAof374RhIMc/JpQmcnDlVO4hT0Oim/mkTGf9cyoV/gfzm+uPeiZ+?=
 =?us-ascii?Q?dhUOiohl1O+RBGglSxaYuGOzYWh2F2r6l3txSN1xw67M7PPVzxRWTFR7cwwF?=
 =?us-ascii?Q?F0KnYohUOAAiLu5OR28=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a68a28d-fc6c-4f5c-f718-08db66e150cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 22:56:51.2282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xN3vWu+1aF/khBYf+m/3i6mi9WC+tbjxA2c2Sn4IpvkPMR3gCqUg9WX36arrfBLRCyqFbzilUA9JF52WtBwlIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6147
Subject: RE: [virtio-comment] [PATCH requirements 0/7] virtio net new features
 requirements



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 6, 2023 6:50 PM
>=20
> thanks for write up! great start.
>=20
> some things look a bit more like a specific design that you have in mind.=
 we
> need to take a step back and include the actual requirement too. it's ok =
to list a
> design idea too (you call them examples here).
>=20
> splitting different areas in separate files might be a good idea.
>
Yes, as it grows, will likely do it, when the design part takes shape and g=
ets extended as section.
At present with 10 to 20 lines in a file is overhead.
=20
> some things will require virtio core extensions.
>=20
> I have a generic comment about limitations such as alignment physically
> contiguous etc. It's natural for hardware vendors to try and push complex=
ity to
> software, but in the end this might just shift overhead to driver/TCP sta=
ck.
Mostly for sure not the TCP stack.
Some part may be to software.
Overall software cost might be same or probably slightly higher but can hav=
e overall system improvement.

> Please try to add motivation with each requirement.

> I pointed out some of such cases as "weirdly specific".
>=20
Yes. I had the rationale section, but I dropped it in the initial version t=
o add on need basis to cut out the obvious.
Will insert some of it in v1.

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

