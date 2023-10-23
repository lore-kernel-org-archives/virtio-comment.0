Return-Path: <virtio-comment-return-7916-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF056CDB474
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 13:29:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 10B4977C4F
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 13:29:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D2046986917
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 13:29:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B3A33986676; Mon, 23 Oct 2023 13:29:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A36D2986677
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 13:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSRW1NXax8FtGlTRuVzqeeLu2oGSmtggll8nLEp9AWObg5G3Jxtm/OeNY5xBqnux9N6qDOmqBZwSsLKUk1vxKBN8MSbaZ79z55h2SkyQPF/MUb2CaJC4iG+nKpkiLqkHJ99fnnlEag1zPbpTnHROXDoPsfa2+1d97J7sJctj2auMzKnUztrrEXeM8vfD9eW+aDmGCbWZpWnCXSkjeV/wQS6l6KQRG5YgLYDMqs34anyS8IL4AlTr2zBKQCboO2w5bdwNpQo1pQKPI3Uwfsi26cJx6PITqsnMGYUDPaE13aJwfnez8cK0b9yLZCIJp+bcZVSoRZeqOQ95Mst7oQfwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlIqPpPgOOgNsSAqGKrhV4QpwvLRSbZXkQM8EeOJock=;
 b=NBmYUWFPGlD3rvoe9zOXNccyc5Aw+eRA/SyZPbjYns4d2zdz/P+rXqKJOaHBRfBvhvugCnubtdeP9ffo6XTMglYc+L4CF3/hWEU2ln8nF7TTL/fqFpJ51NFYNVA0qc3rGKjtASsDgZ2r+cr5dOBQ2zII7FAOGSI5wBoxzKLQWyyqm+0xrYp2aVi7ufLDzofXCbt0B4nBjvPAFe0GUtdRd0v7nXI0JZIch3yElGtral6hZBYmaD6ZVHyeYNEuT13BkPYolT9eZRO44tt+/aOoZPHsjYK5YS0btaf7Eil1Nra8z+Bt9oMeJfyn/DuUVqmVLLBvD4/tFW5ctVbWbdzKVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUA=
Date: Mon, 23 Oct 2023 13:29:48 +0000
Message-ID:
 <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com> <871qdte8r6.fsf@redhat.com>
 <PH0PR12MB54812DF4DB53917D4895FFCADCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87sf68cjn0.fsf@redhat.com> <20231018062704-mutt-send-email-mst@kernel.org>
 <87pm1cchuq.fsf@redhat.com>
 <PH0PR12MB5481DB9D38E58522F0B15EEFDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548188345E2CF3B8AA5E2DEDDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB548188345E2CF3B8AA5E2DEDDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5948:EE_
x-ms-office365-filtering-correlation-id: 3a942042-5024-4cee-61a2-08dbd3cc213e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 o5DIhxV+T0dqpyphcjDm9mA7Y6VU+eZ74MzJiX/Td10tdIOmQo1sUdnba1NR85dIBLlpazlc9+zfvcZzTVwgbN7ef1ICqvlgDJKfObfZ0yJ9YnmmcGZTHXMBp+R2+j7i7kCPVpe0J9B8sEIF9qs+aHOMcBaQTXd/3HpsnX4OJ8yjI5+2C2+jNRP+IwDZFkp1wwM+gWfLI9mvJWkLggq7buKZoN6ACVFgJcFPITNLGo6WJ/vugSwynn+moVTa223khr965p0ZlDuekalEnRyZxDHauEgbYyp4kdcyUfFAdY0A7BXzgSjUSid4WD+m/oXbMwfNy94RCxmVbd/z5OkhQdWf8SvW67kefG5FimjQhkz0eblUBt6zW+AOp+k1nvr3k7FHRyH/76RouZTqZH9mD2KgCDtyi4aKIblhmqsW2/Io1OjL3fPPeinQcZCmqQtJ5FmNOceVrMK0ybmZYgEGobw8jDCg1cCES7O5zQA50+8A+DSX8Lm1njv0ipeex+/09NiUBamTki8C1upVY00Gn7TrIAKfO/b5ZGLSYcCZsLpfGIE3nyNZ5CbFm4TXnloh8Z7fPJgSLMnf4zJi6hfOoMCpWTfjC5VaBlc9yeNKYN10ZofdnKOjsIr7VUwVhMojpe6A197MiTZIDm5sRwOROl0lw5Cw3B37QY/Uxn3lr/+WKMepSdbo+RIWr6ZZKvkFTS03UzZ6LsF/ITSR71JgyA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(41300700001)(2906002)(38100700002)(110136005)(316002)(66446008)(76116006)(66556008)(66946007)(64756008)(54906003)(66476007)(122000001)(6506007)(478600001)(71200400001)(107886003)(7696005)(55236004)(966005)(9686003)(86362001)(5660300002)(52536014)(8936002)(8676002)(33656002)(4326008)(38070700009)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cO5kTQuLg9Bcv9OLufoiMhwvwY9J4BwyRpPSRHicMkuQWxz71ndH/lgmS6Kh?=
 =?us-ascii?Q?csVQtuO9RTv7mXOh9xdV/eWC/VsDZks5YwTraLY5uBatPfO9etUzyu/zRjaE?=
 =?us-ascii?Q?c2HxXPWGyEfDD5vlu4ukob6eE5RSENRndjrUwBpGrGeCKMmaaNmCMEIMwsfF?=
 =?us-ascii?Q?8uynJIfm+v47t2K6Nt2SoD0/6P5DF5729CbO78Eigv7Ac289fgCEi51IqeN8?=
 =?us-ascii?Q?Lbe9QRJalITGHgS+g56xfS8tCBZLG7a59h2g16h4VJiO2tWFhAHmbZQVQszf?=
 =?us-ascii?Q?FD7SVHotnZ21Gq2xYKIqb42RMWs3mVKywIZpozA/kEaTcu9yyC0VhVrpoeql?=
 =?us-ascii?Q?XjBA0LTbG9QIsIbri+jz5X/c7aPe+i1HDUdXSmKN0EVSyzpZ6f35YlOU4YVC?=
 =?us-ascii?Q?qnUn1iIxZRkpiHtlhFCQHXPbfZQKpmRj9MEUHZqla0srniU6XzMn0xPUt7Dc?=
 =?us-ascii?Q?jzttu9uonMfJTw2nRRXgBNP4/WBzB0CFSF3LHlgfSdWkvlm/uojUph50yEnu?=
 =?us-ascii?Q?OWaQI/Okrs+BDFiHycIOq48xIhXcbWtz7Ea2dMI0FrIwnQ9X/S+QwAbCloFx?=
 =?us-ascii?Q?zdx7OJa7F6qg2b8K8gE7qos6IeJi6l0oG/P5XFWpBuuOy/qGqjCMIhYghu8o?=
 =?us-ascii?Q?7/qH8gsx3MG4xwS842RLLaSQq5lNa4DvY9RLvy/iFJdDjFHeprHNbDp4rr3M?=
 =?us-ascii?Q?oXhiWOJFimgkqhPCsG/zsLcMoyhGcGlDYBWwCM+3La7bX6E4DBRqnQI2aRN5?=
 =?us-ascii?Q?u3oHUFA1UjTOqMolM9oUQJXoiBdvnw1KizWoBAYgmrgFtnx+FP50BjYukNLp?=
 =?us-ascii?Q?ImDGUM3H4WcZYrSQQBWfZkLUc1zhV/xxIf+UhwB/0tEOnDH6IJTnlG3Tl3S+?=
 =?us-ascii?Q?JExPOk87fxUO+tN3TQrNvJRU4S7kCcYKIIljQ2nLn0rK96NWKWlg75xqFX3c?=
 =?us-ascii?Q?53VO0y034Q/roa5SFPG81JrEk+QkfOpH/4UwNkuD2YOrhZwFhN6UA0ZlQIte?=
 =?us-ascii?Q?q9KbRqiBSWvVmZjVtbxTeZbSXgEl5aQniIoD19yEhwSAu0Eg5ktl/UoHoO9y?=
 =?us-ascii?Q?XnKMZ1u2otjDSb40eQ+WTnWiUsLFS2pUN+/CGykry97y3vGmHDU+8nvsunCg?=
 =?us-ascii?Q?kBRjrUzq1wh43ibhzErTGB9G/I3Tycnf2HdIjwBNKnh7yfpzjVNmh+udlwHL?=
 =?us-ascii?Q?T1XeDdbbD3oqgt2DVzlWdxb8YNJtv+usLWeVjwIcFimSMRnY6d8yuhlANz+m?=
 =?us-ascii?Q?wphsP3OoKJ3j43vhtjZqLBgAAxvC8G7414SXAfNVCB0Ipx53vZjiTiYeLWTe?=
 =?us-ascii?Q?X6vwYgaxAkatAXG2rWdkw4fh28e8sHl0Y+WBo1sVq7E5kzQvP/M2Em73R+/H?=
 =?us-ascii?Q?9nssQN3CgaiCPrY0pu5d2plx/uwDqm3H/ubnMMc6rMs8iG4+6I51Hekw8GRj?=
 =?us-ascii?Q?q1mPSxXD0j6A/SWPzMzmA9EMnetkGeK/fg+oOl6H0VSbNfrCxog/RlqcrYNl?=
 =?us-ascii?Q?QPibWRD25GcBL0//2MdKsOf8Tc/tAbauSaFRe8O/l9X6oSxA1F8Yn1VW9ju0?=
 =?us-ascii?Q?w3EnYC8AtKIn+uXsIM8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a942042-5024-4cee-61a2-08dbd3cc213e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 13:29:48.7093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQOSty30mnTEAQtKy7gQOsvpmnO3TzPxWd+PMBgbpOAMCPxRpXCCOOpJTd+qZvmrd6wwL7pjNAUU4WDEvq+OcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5948
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

Hi Michael, Cornelia,

> From: Parav Pandit
> Sent: Thursday, October 19, 2023 7:27 PM
>=20
> Hi Cornelia, Michael,
>=20
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Parav Pandit
> > Sent: Wednesday, October 18, 2023 4:43 PM
> >
> > > From: Cornelia Huck <cohuck@redhat.com>
> > > Sent: Wednesday, October 18, 2023 4:34 PM
> >
> > > On Wed, Oct 18 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >
> > > > On Wed, Oct 18, 2023 at 12:25:23PM +0200, Cornelia Huck wrote:
> > > >> On Tue, Oct 17 2023, Parav Pandit <parav@nvidia.com> wrote:
> > > >>
> > > >> >> From: Cornelia Huck <cohuck@redhat.com>
> > > >> >> Sent: Tuesday, October 17, 2023 5:55 PM
> > > >> >>
> > > >> >> On Mon, Oct 02 2023, Parav Pandit <parav@nvidia.com> wrote:
> > > >> >> > +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver
> > > >> >> > +MUST enable the required number of virtqueues before
> > > >> >> > +setting the
> > > DRIVER_OK status bit.
> > > >> >>
> > > >> >> What does "required" mean here? It just chooses to enable the
> > > >> >> queues it wants to use, right?
> > > >> > Right.
> > > >> > Required meaning, whatever number of queues that driver choose
> > > >> > to
> > > enable, those must be enabled before driver_ok.
> > > >> > So it is "required by the driver".
> > > >> > Would that be ok?
> > > >>
> > > >> I'd write it as "the driver MUST enable any virtqueue it plans to =
use"
> > > >> or something like that.
> > > >>
> > > >> (...)
> > > >
> > > > It would have to be SHOULD - we can't add new MUST requirements
> > > > not contingent on a feature bit, we can give recommendation based
> > > > on existing installed base.
> > >
> > It is not just installed base.
> > Spec clearly says that:
> > "Perform device-specific setup, including discovery of virtqueues for
> > the device, optional per-bus setup, reading and possibly writing the
> > device's virtio configuration space, and population of virtqueues."
> >
> > There is no feature bit or any text that says "population of
> > virtqueues" can be done later outside of the device initialization phas=
e.
> > Only reference is _F_RESET bit which is only for re-enabling. (not enab=
ling).
> >
> > > Then I wonder whether we need to add any normative statement at all
> > > -- prior to the introduction of this new feature, the driver had to
> > > enable anything it wanted to use before DRIVER_OK, and if it does
> > > not negotiate the new feature, nothing changes. Spelling that out in
> > > non-normative sections should be enough?
> > It is already implied in the spec that queues must be enabled before
> > DRIVER_OK.
> > So what is written in normative is not changing any behavior.
> > It is only making the implied behavior explicit.
> >
> > If it says SHOULD, that means, one can enable the queue for the first
> > time after DRIVER_OK stage too.
> > And that would violate the "Driver Requirements: Device Initialization"=
.
> >
>=20
> I have addressed the comments of v3 in v4 at [1].
> The device requirement is kept as MUST to keep it aligned with the "drive=
r
> requirements section".'
>=20
> [1] https://lore.kernel.org/virtio-comment/20231017143135.758523-1-
> parav@nvidia.com/T/#mc49b6e54186c5f1b1e8c743bc440ca0cc0938212
>=20
> Please review.

If no comments in v4 which was a week ago, please raise the voting ballot.

[1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00183.ht=
ml

Parav

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

