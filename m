Return-Path: <virtio-comment-return-8243-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F48C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:12:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3C96A2B151
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:12:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1A6E0986B5C
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:12:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 049659867FB; Tue,  7 Nov 2023 11:12:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E956F9867FC
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 11:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpLE+8szWzW3NswXGvNgkOItHaHDe0UJIWrO5EFUckYPxy4Bl2Sctv2PPreNhdmI4KDXml9DiaqVS3WwWP5Nso9bpFYCI20hEfXmc1/zzcA4h4knLnzJXuKLngvn/xluSZHhi9L2qO1JTC58TS6KvoIqUeVB/SO+2rYJc98OksqQwTPnlwy2ZUpF6tyYOaAqrd8vD+Z2pnq+NPPeL4k7C4Rl5eNOWL3/SkBebrGz5CDF/rkznhLFmTl8W7OjJsEZLow2W+03k3oUu0KRvfwZOg17+h9GYmMDnK2aiEfFXCXtEVUaKsP3nYvxN69HuVVh5UT1Dtu7U35SiCxdpqPhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3atsLUKmmG0NvvDf3S+2/KeJYeXS1i/oqrpaNkRKAgw=;
 b=OWovermMHDzTMBClkzTmJW/rdufJ8N2jzxcvOVr4M2XcHQ7lo15KI3xLT2Vp8mO+sdrIl8gTuAAfQB2kxPnfoaS+JIS3CChKqhk3fsDwec/G12rfZiG+qbP0dz7MGJySGeq6N9B3PlZUghHdOxWMP4K53La/TJvhwPAhfabdkNw7eYSJa9OzwsTxhf44b8as7JoCWK4Lck4ZrHjEQoSO9Rd036mNGjIs97Xyh8WVvVTxOSCUf16SaIlGLdRekkQONqS0L47B7kvQJIOFvThjcG2rEeIDvcQm84Br1Joe3Z5cZMzFNSwLla2Rb7zNPpOQAixadwGVNe8QOyYmV6y3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "eperezma@redhat.com"
	<eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 6/6] virtio-pci: implement dirty page tracking
Thread-Index:
 AQHaDkFr7w3tkrCqqkSwyxm5dwAptLBoapSAgAABpXCAAETRAIAACO2QgAPyz4CAAAX1wIAAWYwAgAAWBzCAAYPtgIAABqgAgAAGLQA=
Date: Tue, 7 Nov 2023 11:12:47 +0000
Message-ID:
 <PH0PR12MB54813AC62A9D6811585A159DDCA9A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
 <PH0PR12MB54810847007367DD75FA3D60DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <431c0495-f0d9-46d6-8336-cc2bd293cc35@intel.com>
 <20231107051012-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231107051012-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4562:EE_
x-ms-office365-filtering-correlation-id: 181c30f2-0d99-4bc7-3fc7-08dbdf82797a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 42tfzAkYA2ho+7ehD/gt+2qb2jyaTWMgUoWee0UIFTNqPVet8HFMIY5CP/BaTPGIlkfNIMea2+QhXIMU6YR6o95XYRK6jXY1Kl99TP2QM0blKdZRXXtho0GY0RzOom7O0yl+id5bg49I106PBZY2Ttfq6QF/YpaMYrKBRzLGlT2Wn/saV5V9yqFgxZByuI3S9caa+vF/TeklN0aFG66OEAmhE2NtwIs3u0sYh2q7P4sxBYYLS84JO7rCFmquD3fqR3Oag9aq70S0fSVeAyejsty1V7woWkd2RTMEfFSPXt2y3ojLmXem4k/LKGgQZtKlQQtpfygVVCrzPZX2VNPImWkz+q3OJANPD5f8OgBs/LISneo9IMt+fP0sjHmweobRd2uUHpapMYlEadxQiPDYeP8xlyReq3gtd1qYrDq2ksgOWsr+5kJ1TBXtWEcie49tzBEEOuLD1ODCR3UvoG+S0S23CBzPLuQLsXzHhXGJd0uIu+EtL32OzNadsT5ltLxyzdjTcxtJHY+71tul4qnT+UTanLX8py1b8QGUqv0vRQYxo7GfjYfSa5yGr8NFwAeRFCBIIdoFN/mN0Vu8Kv4OxYp/WwD9aPuCeXi+SWLRw2LkV/zK8C13q/Yd9w+X2NDtAlUObAyp/bvnVOQeiHvf/Kl0mUclD6gormw989hlUDw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38070700009)(66899024)(55016003)(76116006)(66556008)(66946007)(66476007)(64756008)(54906003)(66446008)(38100700002)(33656002)(86362001)(110136005)(122000001)(71200400001)(83380400001)(26005)(7696005)(6506007)(9686003)(53546011)(2906002)(478600001)(316002)(4326008)(5660300002)(41300700001)(52536014)(8936002)(8676002)(582214001)(14143004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?j0HRCbmb2SNMmyQaW3l6MkugdmOTKCph69KyTkmBXQfstos7DqNBzOnoH49h?=
 =?us-ascii?Q?IhfjKjCcyDKkr/AAoqoMnNQ2qIi8bXLl+QTFryS6xKlGWkne+6H3h2qTMtVi?=
 =?us-ascii?Q?3tfI+R6+6F/yQJblXSRFMZ6SSkoQn5uPZ2bwzxZg1NaL5P1wh6qiDjtLH2lQ?=
 =?us-ascii?Q?hxHJpfKqDUi4ZIc7YNFAlHv7SgUxKLMrVJKdCg3lErYOhdWWyL+B/+y4aWTX?=
 =?us-ascii?Q?uEl1i+kH+xR54QwVC1Yf2+ObqAYzUILkiCD9k+5L611VNzFAAngr8Oyk4rBW?=
 =?us-ascii?Q?maPbeCLA2fw8utC63Ga7IzSUQfMELcRAg0I6N8NHv/EdD05KfK33GgWMc1iH?=
 =?us-ascii?Q?ZA+yZc4/7IkPLbA98Pzc6Der4jF+knwhpphR/mJWDcGkloK2znsnMg6aa5bi?=
 =?us-ascii?Q?6UaneJ+eZ2gy4H48MESk8qINyfjeKqf6UqmSXlbCNvWVNVqhm5E4isK/HnH+?=
 =?us-ascii?Q?bHgC0nNFalfUDiVaXRJTMvwXlUYQMlqwVzzY4TZU+fV57+3iM7CQw4GAgZDe?=
 =?us-ascii?Q?GYfxD9HdScsk/aqMKfdFtw5uVjAShvhDEAd6Yjj8ksDzZxVoZHb5t0U/8oRo?=
 =?us-ascii?Q?Z6V6GmfSgnIVO/Muakv4qJnttxv7mf4PnNWMkm/O/tfUHd/b/rX4Uatqo2X4?=
 =?us-ascii?Q?giEh9nOb3G+xgdYhLh6jQpQmy3AJtFrSdfDqwwXW2G2mqgcUxpP1aJ+Q7eE3?=
 =?us-ascii?Q?yivwNBK9mxkNXbLGN4GQDwbTH8dh6eGFPF7+Z/3NkYopS2xsCYITwL+qQ1Fj?=
 =?us-ascii?Q?wVnFD320p4DuszTthlvzJyJ4h2TLSIP9/qR6cdy7T1SxIN/CNcIgm8FzZpZI?=
 =?us-ascii?Q?A335mpgYA6sp8dOg0OXTMtVVdpGTQXOJRO+qXtqxPGA9nYNqkE4NLVMFwgMA?=
 =?us-ascii?Q?rjAVaqO/yQdMhn12pPf/Nc985RT1rbLlzSJ5tEu2+dTqdFqMl1dQb9NUNpxD?=
 =?us-ascii?Q?qVxZG/NjniRR6q2NyROhiyfU4y3OK7jgjRV26RRWmblZaQYUZ9EtEOHozKl3?=
 =?us-ascii?Q?FmmKWKl6YSrIkIdMV+QetKzz38T9Y1r99beCAIZD1CunFmUht3rX3LNK7WwE?=
 =?us-ascii?Q?OkZqHIlbQvpSZBJf/qOTzsYL67ppeVSt2m28sKdcp/S8hbjwUSxKSUjdHJ82?=
 =?us-ascii?Q?M4AKdwwWMQ8q/XObEcWfIdIS3A/zn5yuWYHY2scAWyWjhtaGA3CTLztBqR6P?=
 =?us-ascii?Q?MAAuP/HU05G/mnMld9UsyC1fH0bnUawQifaUX/9Ou+oFKm4v6JfxpCEHwX9G?=
 =?us-ascii?Q?702lAcdsDYhcSXo9aIqcAfeb0r8CJTCoo1buEkREkThmjYmJhcHcWcrG1bUA?=
 =?us-ascii?Q?ymRZ50y9fGuXhTOLY8fASkFaiJ57RfNENME0klGjHM2dqngUwvCB4MdTnpCP?=
 =?us-ascii?Q?v0yYpf5TTe/AKdEg9SxJVM05VBqJ5GsPGowtuR8XjtKAOM3uulfoKawCgicG?=
 =?us-ascii?Q?cHRkNWyIHN4iCw8MgqALm0pzRoKEwY5QF2RBnCo++nBoDzX1Ed4S+APOBxZC?=
 =?us-ascii?Q?mlbN4/+d+tPnlaTBpHqZq6Fc06RBJEv/8aEVvyK9u8hkjHnio6wJuCGRA6z8?=
 =?us-ascii?Q?liBNL2AZ3y6WqFo1tY0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181c30f2-0d99-4bc7-3fc7-08dbdf82797a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 11:12:47.9303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u5eOM1Yiy7/dboMB1pbIfF5sGuwsG21iHpcOOFsC8/+fE/wDtQs7RrgP3WHeMgXc7cKUlx7OAKVz5xY+dtcegw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4562
Subject: [virtio-comment] RE: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, November 7, 2023 3:55 PM
>=20
> On Tue, Nov 07, 2023 at 06:01:27PM +0800, Zhu, Lingshan wrote:
> >
> >
> > On 11/6/2023 7:13 PM, Parav Pandit wrote:
> > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > Sent: Monday, November 6, 2023 3:04 PM So, please no pass-through
> > > > discussion anymore.
> > > If you comment like this, nothing can progress.
> > >
> > > What you are implying with above language is:
> > > "hey a virtio can do live migration ONLY by creating vdpa device on t=
op of
> ALREADY virtio device, and you get another virtio device by running throu=
gh 3
> layers of stack you get virtio device on other side!".
> > I never say that right? I keep explaining how pass-through and "trap
> > and emulate work", I even explained how PASID work.
>=20
> Parav, Lingshan can we please stop the "what is pass through" arguments?
>=20
I am not discussing it at all anymore.
The use case is well defined and seeing how we can/cannot have one proposal=
.

> I think thatthe term is vague, as
> (almost?) no hypervisor passes all accesses without exemption through.
> And the fact you are speaking past enough other on this subject for how l=
ong
> now? seems to demonstrate I'm right.
>=20
In v3 I acknowledged both the use cases in commit log unlike the other side=
.

> Describing migration in the spec as opposed to leaving it up to hyperviso=
rs
> seems valuable at least to me since historically hypervisors did such a b=
ad job
> of it.=20
It is done in v3.

> So I personally feel it's nice if it's there, and the SUSPEND bit only wo=
rks
> after DRIVER_OK. So that's an example argument that makes sense to me. =20
As talked suspend is useful and should be controlled by the guest anyway fo=
r power management.
Hypervisor is not supposed to use it during LM.

> But
> number of layers involved in control path seems completely irrelevant to =
most
> people. *That* is an nvidia thing, something very specific about vfio and=
 vdpa
> and whatnot.
> Nothing to do with the spec, wrong list for this.
>=20
Certainly, it is not an Nvidia thing.
Multiple device vendors would like to do this and equally users too.
So, I disagree.
I don't want to debate it.

Didn't you ask at start of this email to stop debating on what is passthrou=
gh?

>=20
> > >
> > > Then for sure, I disagree to it for 100% for such a single-minded des=
ign.
> > >
> > > At least I am trying to propose if a solution can work for generic
> passthrough where least amount of hypervisor mediation is done.
> > >
> > > And an extension where hypervisor has choice to more medication layer=
s as
> it finds suitable.
> > > And if there are technical issues, may be two different interfaces or=
 more
> admin commands needed for two modes.
> > > The idea is to attempt to converge and discuss those details, not the
> opposite.
> > >
> > > Your above comment shows a clear sign of non-collaboration to make bo=
th
> mode works.
> > Well, I see you are emotional, please take a deep breath and calm
> > down, to be professional, give yourself a break, and really not
> > necessary to be mad at me.
> >
> > As you know I am just a Junior Engineer in Intel, not like you a
> > Senior Principle Engineer who has spent many years and have developed
> > knowledge in this area. So I am quite technical focusing, they are all
> > technical discussions till now.
>=20
> It looks more like a passive-agressive flamewar from the side.
> So maybe try to see other's point of view. I asked what's the advantage o=
f
> admin vq thing for migration and you said "it's an nvidia thing".
Huh, really you have to say this?
There are two TC sign-off on the patches.

Since I don't have the link to previously listed advantages I have to repea=
t here.

1. admin vq is must (it is not about an advantage) to support device passth=
rough to the guest.

Passthrough definition: following things are not trapped by hypervisor in o=
ne use case.
(a) virtio common and device config space
(b) cvqs for 6 and more device types
(c) hypervisor not involved in mixing PCI specific FLRs with virtio specifi=
c logic.

> And when people try to point them out to you, you go well tough.
> Maybe but we are wasting time here.
Only thing Lingshan pointed out if some QoS on AQ.
He never responded on dirty page tracking, why he cannot use it.
He never responded why device context cannot be used.

>=20
> > We always welcome collaboration, remember Jason has proposed a
> > solution to build admin vq based on these basic facilities, and I am
> > fully agree on his proposal.
>=20
> I didn't see anything specific frankly, I can easily see how Parav could =
get mad if
> he posts a reasonably fleshed out patchset (which admittedly, needs work =
with
> wording etc) and instead of review gets back "rework this on top of these=
 basic
> facilities which we don't yet know how they will work but maybe will". We=
'll be
> stuck in this loop for how long?
>=20
The series from Lingshan clearly does not address the requirements listed i=
n v3.
And he is not open to converge it either.

My humble input is:
1. Accept the two use cases listed of vfio and vdpa being practical to supp=
ort existing stacks
2. Try to converge two cases; if there is common virtio spec framework it c=
an use
3. If they can, great lets use it.
4. If not, both use cases need different infrastructure, so build two.

Do you have any better suggestions to support both use cases?

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

