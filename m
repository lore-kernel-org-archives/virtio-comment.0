Return-Path: <virtio-comment-return-8084-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CF6C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 06:48:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 13B0D2CADF
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 06:48:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8743986BB5
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 06:47:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DACDB986BAF; Wed,  1 Nov 2023 06:47:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CBB63986BB0
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 06:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzzTsgfxTVdoUxhj/C4umomcqL1e370UuD7B/GFU22yg+jVAgxph7Kw1JlobSZE25bxqMgKYRPGdScgSSRbLhHdZHbuI1SjHwRA7azWbM6lw6uZTaRlFxhbjGtMJWzOzBeMpbe/2+ENWWJc7GKg37sH2wVaOzk/GjYqxWKGHH+SG/I4E1mSk7Swg+21z5ve4EAsd49Ima4vk7LdjXAESkSWNM6lWB1ihzPhWnXFNK9Gf56B/z54klPgZubTuZwct0rqo8ZfNKyo/zNcfOfOYs4gyM+iQp/4X8xEVS5DNa6ZykTKGu2NLvIzkudTkflbwPo8wyrda1eZdfBhDpFgtRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDhO+d4etxVoY0CDxKiAe6Up//KeCQWeQqyow4/n4qI=;
 b=lWFVt6229oCzCw2ky/jfAxYNNYzYBJLiz1YEedhoQ+crSveaMGO0ar+lA4Dquf0VFOZ4un0JOT8A7deXFVz9x7l1FIWvRIg4VisXn9UFkwMOAASV4In9acxfVhI4aY/GG+Ye5yrE3vDx6iM9mF++ji+/R59gHkGoVCT+77i+6l32UHS8RbOMfLYm9wO6AVqHBNWzUs0ZFX9tyKOZzTWQsgNMqfbC2sEW4tiSySp5xICscvgTBww4S804jeJWBwK+WJ/d9wBvzYcS/Z/Tz9Q46dAMcH7gDbrkM2hVzE+DhuMqaY3AI5cQQgqxyPGh5JvunldjfFUp8N1TvApyp71LZA==
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
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAADeVYIAEiiUAgAAAXICAAZfSAIAAAE8wgALlIwCAAAFh0IAGFdwAgAAAUgCAAGlTgIAAAOdQgAGLtoCAAAjegIABFlmAgAAs44CAAAKEcIAAD/uAgAABWQA=
Date: Wed, 1 Nov 2023 06:47:57 +0000
Message-ID:
 <PH0PR12MB548109F7EDDE8083DFE85167DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101012540-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101023257-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231101023257-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5875:EE_
x-ms-office365-filtering-correlation-id: 11436ad0-6647-4ffb-8ab3-08dbdaa67b4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +A6Hk5YxA4B8r4g4K4kTB3JY2DSP8NXLwpUL0NP0rG90DsPgZ6JoDUDcMKQe+HizbqTjN/xRJjivdTlQYspGXd7hjS6bs4lFjPDh7kDp32dledydpBn82SuJk7DYRJu1z1TFlcBpICaGwIThZBTPJfPmLgzZR7ruAsOUEzd/7+2Rm3TlXH5dDm4mgpieq8I39Thb7SHCieSb2ZBf4MWsibfKmH+L7eYaL/vAFFK01qNby381x+uUI99r47tA1rtY393N/dXzMD90lnN35/zJQidiAGnDrYNf5JkKMgQZnXL8b3qtiJXQ54uVAEeQJUMHaIMuGDKiyK7h7bR6b0zmLuX0DMbjnAATDtVgFit2Oea0at2bMmF06VBfuxeUuSb6F5Z6IwjMi6ZfPTG2LbmuP61Y1fPxlnOXScLCye+P36cxZJCpJhwrYGIncOzcUZxPCD9YtsGFpEr+fcE9ZR6oDD1LratTQvYkLMrn2V2/KqIEnJD0OWCepacMEQgPKdDS75pmnw/gc2NYgL7RgkU+py3r+cjrgDL67Hi1exvvxUsCosuyDqidUgbXV0+bF0WBXvqpRv9V29b1TxovPEwBhMxxtyETuee4YLTSEphz0d7n3F6nJSgljiW7a2NZi662
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(396003)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(86362001)(26005)(316002)(6916009)(66446008)(64756008)(66556008)(66946007)(66476007)(76116006)(38100700002)(54906003)(38070700009)(33656002)(4326008)(107886003)(122000001)(52536014)(9686003)(7696005)(8676002)(83380400001)(2906002)(8936002)(71200400001)(6506007)(41300700001)(5660300002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XlHKneV/j6S5QakwumoSmPW/yDQdDrSFJjXi+qvmVc0XUy6JoDHtqbqH+nWn?=
 =?us-ascii?Q?3rKSYnPDkJgs8+y6enzjpo3ehn22MGNzcjzNFdW1e7Dk7y70rs61aGtMvyb2?=
 =?us-ascii?Q?ih47OGcYGzUk74kBBGKdJGYUiYo/LYJd5E+IEatJJ0jylT1l6XBmkTRAo4kb?=
 =?us-ascii?Q?bhsTS/f46VZJrsv3Ot09T3mI8IDwNW7r16F13Urku90NIJRNHzGVKJH+LG8l?=
 =?us-ascii?Q?E/XlWmcPqoIbhr1wopUp91gafeELj/634V147588GsSoTrYXo0Z/5lDZwBcx?=
 =?us-ascii?Q?1/LgyRz7DNV0fgdkophjY0tFovBbil0VDExlWTjiL0xexgCI96Uka+lRrLde?=
 =?us-ascii?Q?+fNIRUj2An2kDVCktlr04qtUqtaNxM+dVcRWSD92jz2FjQ/+JHs5YyVYoYgC?=
 =?us-ascii?Q?UOvVe7nuOMpRSNzSnWOzzdUF7qdPuq+GyPX+cJULj/Ht0RNS4nMsFQyIVK7A?=
 =?us-ascii?Q?9LFLLWSCIl1FuMRWRiOPFzilbP6TTeZnqR8W58nQ4wDfrh97xKbR7VbIqpgr?=
 =?us-ascii?Q?lrMjP3FKTOg/a1njpDvVgbi4UxZeTNRBTpTYuqR2NuUugzjwo1Vwfhjqrjrd?=
 =?us-ascii?Q?AFk50usGtDA8YIfe40sNaSMKoJYS0gDTo2PGvKsRUZcyASS7s1RYx+7UrFLM?=
 =?us-ascii?Q?nTvTRWzjCbUNcVnrIQKQ0VWNUmIaURQlW8HYPdqgbT63d0NgHqT1frJrIZJj?=
 =?us-ascii?Q?DSdS0H2G3lScIwlK19hWQldnFTxf6UrR37tHd0XKPAb7NtDhu4iY8Yajmua2?=
 =?us-ascii?Q?aOzluP6lHIS/3jMMEHWmXk+/cLZSDCmuxIlbgas5igbkN8uo9G9uRistGZsp?=
 =?us-ascii?Q?OfkWD5xamAl+8s9p2A53OXGRzm8uMBfdRpfmwkFx0LlDm48VuDo8usLbvclm?=
 =?us-ascii?Q?NJJvjbEsrx6XEhgGeXEe6jo5f8o0wKp+tjh+GJpk+iNoYIcpNQjBmIcPJQRq?=
 =?us-ascii?Q?v9PhVXGcM5S3KXnetdycZOhOHGmvhEGPqGLIq/GyamUCh805FBkXpaj0ddm8?=
 =?us-ascii?Q?V49IOIlHOHzByo5PpyemRfdB/YjyILCmiE/3+XSk98fgAIwAee1PSfmTHFFz?=
 =?us-ascii?Q?ursYQvx4NRHlGn+OiEYt7sVOQ8rEpPEOJLQAuDNJ/dxxuVu9HprAKL1869+n?=
 =?us-ascii?Q?2DrgbLEYC+yk5sbAbl9gyYlDfEuZUJAWrLCpXVXwJOp1MJr6S1rp6Nt9rFAI?=
 =?us-ascii?Q?zZicViZ6paEwrXPxVkP2gISAff9JrrBfG8FHPSnNDYbqg6aoOvijc0VkafGp?=
 =?us-ascii?Q?XO0UeqjKhzwVxf3JW7MrP2iztXQSOGluwoj65u7zyzVbl0G9kNsbUPT0pYSu?=
 =?us-ascii?Q?2NPGAxxzmH/CMoGTH43c0JpgG3LkFxLWz/tJvv8UtfZ05C+bjVz8IntG4SNM?=
 =?us-ascii?Q?rFK9Qmq71lW8oZ/5dFaTpdYTXLZCmkKCiI4/VohsJFoVgsL61HCNBzW/LfUI?=
 =?us-ascii?Q?g/9p/2zTZi/QmUbEhsx8aCr/xbAB+tSumwISYKg7dL+ZoFGmbztX6mdoujZ3?=
 =?us-ascii?Q?sE12sPcFph9zVJy0/GslkxTdNsFlRPeHo/6dZbVJVSF65+fsm3AX0N2G7gVe?=
 =?us-ascii?Q?Ut5cV3b4ONz9sRYwAUU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11436ad0-6647-4ffb-8ab3-08dbdaa67b4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 06:47:57.0853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /eqDbSyMYTh4wsSKb+gF4uJJDKBATWqkQGeXGiRKeGfIIF0D3kp6YHokOP+260K91L3wBRHNQWrPni+4qo+ptw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5875
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, November 1, 2023 12:07 PM
>=20
> On Wed, Nov 01, 2023 at 05:42:56AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, November 1, 2023 11:01 AM
> > >
> > > On Wed, Nov 01, 2023 at 02:54:47AM +0000, Parav Pandit wrote:
> > > >
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Tuesday, October 31, 2023 3:44 PM
> > > > >
> > > > > On Tue, Oct 31, 2023 at 05:42:29PM +0800, Zhu, Lingshan wrote:
> > > > > > > Your answer is not relevant to this discussion at all.
> > > > > > > Why?
> > > > > > > Because we were discussing the schemes where registers are no=
t
> used.
> > > > > > > One example of that was IMS. It does not matter MSI or MSIX.
> > > > > > > As explained in Intel's commit message, the key to focus for
> > > > > > > IMS is "queue
> > > > > memory" not some hw register like MSI or MSI-X.
> > > > > > you know the device always need to know a address and the data
> > > > > > to send a MSI, right?
> > > > >
> > > > > So if virtio is to use IMS then we'll need to add interfaces to
> > > > > program IMS, I think. As part of that patch - it's reasonable to
> > > > > assume - we will also need to add a way to retrieve IMS so it
> > > > > can be
> > > migrated.
> > > > >
> > > > > However, what this example demonstrates is that the approach
> > > > > taken by this proposal to migrate control path structures -
> > > > > namely, by defining a structure used just for migration - means
> > > > > that we will need to come up with a migration interface each time=
.
> > > > > And that is unfortunate.
> > > > >
> > > > When the device supports a new feature it has supported new
> functionality.
> > > > Hence the live migration side also got updated.
> > > > However, the live migration driver does not have to understand
> > > > what is inside
> > > the control path structures.
> > > > It is just byte stream.
> > > > Only if the hypervisor live migration drive involved in emulating,
> > > > it will parse
> > > and that is fine as like other control structures.
> > >
> > > The point is that any new field needs to be added in two places now
> > > and that is not great at all.
> > >
> > Most control structs are well defined. So only its type field is added =
to
> migrating driver side.
> > This is very low overhead field and handled in generic way for all devi=
ce types
> and for all common types.
>=20
> Weird, not what I see.  E.g. you seem to have a structure duplicating que=
ue
> fields. Each new field will have to be added there in addition to the tra=
nsport.
>=20
Didn't follow.
Which structure is duplicated?
PCI does not even have a structure for q configuration.

> > > We need a stronger compatiblity story here I think.
> > >
> > > One way to show how it's designed to work would be to split the
> > > patches. For example, add queue notify data and queue reset separatel=
y.
> > I didn't follow the suggestion. Can you explain splitting patches and i=
ts relation
> to the structure?
Did I miss your response? Or it is in below msix?

> >
> > >
> > > Another is to add MSIX table migration option for when MSIX table is
> > > passed through to guest.
> > Yes, this will be added in future when there is actual hypervisor for i=
t.
>=20
> You are tying the architecture to an extremely implementation specific de=
tail.
>
Which part?
=20
Not really. can you please which software will use MSI-X table migration?

> Hypervisors *already* have migrate the MSIX table. Just in a hypervisor s=
pecific
> way.=20
MSI-X table is in the PCI BAR memory.

> queue vector is an index into this table. So the index is migrated throug=
h
> the device but the table itself has to be trapped and emulated by hypervi=
sor?
Do you have a hypervisor and a platform that has not done MSI-X table emula=
tion for which you are asking to add?
I don't know any.
I am asking to add it when there is a _real_ user of it. Why it cannot be a=
dded when the _real_ user arrive?

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

