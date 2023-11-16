Return-Path: <virtio-comment-return-8397-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284C8C197A0
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 07:41:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5C25745B35
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 07:41:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2C524986DD4
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 07:41:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 02576986DD2; Thu, 16 Nov 2023 07:41:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E66BA986DD3
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 07:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaAUH82Im7FJv5J766v1/CW4I0LAaYzDNt0vMA1xj9LWUejozk9vdSchQQBo23C0qGOo585YajDDJIkGEXX7c+Ra1vL5dqOLVMkLEgPbG69iE6z0OzSYA8sFCDIS8XJU1JgbKLvdMUXAFm8m9YoQbX2hbvpwnrR9dadPZoD97tLA19kKlL0FmFZgWx4ts3sMx9aYO3XBRnLkbzFCVqqIWJ8rrmBdwqnNUr7NEo5wkwU0JJfTrH4fT3iIDt3apQPoHL/ach5kSh3O/q4htgEBvGEzZuYOiTDzfP4i3l7KF4sRr0OZTb8QO1s4mLe79QyI4XZQay0RaSTv+oLlbVIQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1ehkPcuuefx7ouLr15Qdjo1/zVs1z574INBJRM0pyA=;
 b=WpxNN1t+gi2mv8LTzFG7KfMNaL3Qo900iXvze6fyoi7bhA0E5ONZwDhAbRo8gLUpvMvH1KXp6xqpA2aHPss64D5eiUgkZeo/IXotw7Ol44WY+f/mKO7gC7+FPB932eFcHEwsxOaN6hDJCwIJfeXUsFXtZN4EZ9bBkG4DjzqaZHBk+wgdZW/nT2Ir1TlIEFP6ICUI10ARLJ7CwWIXI4btgnCxYWCmFPyMXXdUWAMsB/BY7SwIOwznCXTq55ikqldJ1efpBtrfr3MqbXMc/+FdjXzSwK11uoqYYeH2AJibSq7MUKtigoy+eVRLS1Obz0FHgGXD0SousLJ18uw/PRIDZQ==
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
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/A=
Date: Thu, 16 Nov 2023 07:40:57 +0000
Message-ID:
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <20231116023443-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231116023443-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB6881:EE_
x-ms-office365-filtering-correlation-id: 841124fd-4b5f-48ef-3172-08dbe6775f43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cMzWitEuks5hbiPig2lxsQ0P7xAVEZ8E1YDh7vRkDi1gBCeJq3ErJPx7fshQpSN6K9NifGf1WA0c35wlz9+DhMAJZWJY7DEx95uVjK0rVd9Q9mC++qMJrtfc9JrjSc+qtQd9mLuFPxdVcW4EYq/o6XGOT2P1VteH3ksyrvKe/qPrBWGNM9vPZj0wCk+Jf/AwuS9hmEIWe7ld7zyXe3879w98v6X9JN4PTCpMqEC/eBQTPBpQ5EnYckr9vY7WdXwitq5IG3+VEiHS0MaA0bA2iLXWdKO7knTcexqrHkUyCbJtmP8fl04qhPZDkOpo11eTK+DC45afYK/opSqlYuvcC3LbLwuFLhnCtZWDqyvoLCaPcre+xXgu/0+Rz4MpCrkiEgtIMEfqn8Z4LkI6LnNBcoS09RS2LkmLa7Px+Z6fv7qWR4aCRcTqg04U9p2qryjj0IvQUr/mYrkHcXQOgp4VQCua6OwlL7xtat9VQGptvtLh9qN7mwlvC6rZGSQdp7Cuf0SYoRWe3Dn2CFSCe6wddfaCFOhgBdbtWOVHR4rjPgVMjLHmHF/R7VTrdYW7mRO2hW84tuZhMj3KmsmIhRPBywUoHe6AeeA4rbY48XTFKfX1/72JIbJzVnp34kg8SONh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(38070700009)(86362001)(33656002)(26005)(4744005)(83380400001)(64756008)(54906003)(9686003)(6916009)(5660300002)(66946007)(66446008)(66476007)(66556008)(316002)(478600001)(6506007)(7696005)(52536014)(8676002)(2906002)(8936002)(71200400001)(4326008)(55016003)(122000001)(76116006)(38100700002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LXSQkJI9hzpwrlb1+YVB/l0RW5CFdzdGL9o9ENVp6u7MyJjg99lAANjzFK8K?=
 =?us-ascii?Q?aPVN8nhiFTv8V7tRcsHgcbz5hciJfyc8co1u2NYaxhD7xgcVOlai0IqFmHL7?=
 =?us-ascii?Q?MJS9zsniClHEAqj/JW3dhz558Sb9hbmCrBqc/R9VcJfiUdx5KWFr5eHNv21C?=
 =?us-ascii?Q?hG/DshxpyLu9u3yAOdJrJYbZbKATATdiiCV9bZfYJt/14pHlrhPhzTgHD5Kv?=
 =?us-ascii?Q?mJ3Qqa7XybbUJS+yU13pLkNvjnnkHRtedYQ9xWW6akIjzJhkgzl7lxMQJjKX?=
 =?us-ascii?Q?RN6mLD6a+UuirqFDhPz8WIilLH7WfdSaKd8XCyCZbYRuWKH00L0fYQ63bKEU?=
 =?us-ascii?Q?/LuUIrsost1mvqBZt/zAg/1E4z/9VnOuYIUrKbBrtthKRx55IwJGJ6gOWJ3L?=
 =?us-ascii?Q?/WcfNIE6+CY+fOY9GtshJyqAGPHg/fHdH/zGV7eEGyU+B78w2PvzrRxhx1vt?=
 =?us-ascii?Q?dtnzqhzTHwUKjaBqWAo0Z1ebzVguQRQmbhu76D6cHYH5wL+pjjI8lgyxXqOJ?=
 =?us-ascii?Q?lm3hDKbJlUwFZv5dp2+zUFZGl6T/N/0RW7npnRyEU79ELuS+XXmf/nvN2k4p?=
 =?us-ascii?Q?XO7OYPEbH7MRM0cjD9sotQ12L4064sPY3sxP3LfDc1h5vkEJSmSkA27EqnKH?=
 =?us-ascii?Q?yR6SFvOX0s24gHtjR02tWxavgic3mexhqcGfwd0KztwZaOtFLcSKoYsReP2w?=
 =?us-ascii?Q?Iivl5qiWnPWjsXc3AYM3ACGqXKza502IyjVml2TfHLt0817dnwIL3TbhzcYE?=
 =?us-ascii?Q?7RgMlTpREb1PdPizXMRbEscPlnLX3EGs7MgL3xTIHYk1IXboM4nBzfRLrkMC?=
 =?us-ascii?Q?k3CgnVq5O5IA05spCzqNWjiG6TGt37q5GqsTcYiSY2U0GAdnjuHPt1LBGsPb?=
 =?us-ascii?Q?u896OG2nkCC8zCBGc4n5mO+Cnkspb/VgxIBM6tmcOAHUJDLnWa3GOLOg7PCy?=
 =?us-ascii?Q?kvOaijQ/L7U4JtPqIRujBa7sgPdyjZ4xYkj02tPIifHwaw9aiWrkVJdmSM5w?=
 =?us-ascii?Q?vncionSD40scCu4cKb8jAA0Xobn3w+nbxu56cy43mHr3m1ub7FXC9rZe3aON?=
 =?us-ascii?Q?Kvg3KgvV4c0TaPVjIsTQPKLwdWG4As5RbXC3zF3BKkr0JmXdTVVpidfjNSS2?=
 =?us-ascii?Q?SUiNQqh2qsWD/CPVoS75AgZUbUlzcBhYXJQ5ygdi2nbz058iXDpzkrqa4L7m?=
 =?us-ascii?Q?5qHpLvNeS2cYyxT0oLTBhYRx9H06RJvB8nncpJiN8h7+SiYg4/thzL/jQS5H?=
 =?us-ascii?Q?R1JdhYjwP9rIyJNSswdqj4fU4jlTKZJMc7N5al7Hy6FeoTrxme4NdO8S6pys?=
 =?us-ascii?Q?rwJPVlGDoRpe1cbElU1wiZdiXEuikyFHzFPwjRYWVXvKo39zsv7fbweD7Z76?=
 =?us-ascii?Q?O55mXdpIY6QSWnzYkYzZ35qH1rG7FP84+8F12llIIqo8xiwd40Ho6vpoh/UO?=
 =?us-ascii?Q?RZlFKVYE40Vpe5P6/mIdQtUZLurkoL/Er215urwPLJo9ocC0R2Lx0Nlhr4c5?=
 =?us-ascii?Q?yLRCSFIhelkUSsNNQZxMQBUQruf5ag1Q72p193FixkWhOHZ9HOkFsBeGYNVB?=
 =?us-ascii?Q?qVRZRiPA1MZ+GRoWR7M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841124fd-4b5f-48ef-3172-08dbe6775f43
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 07:40:57.6669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i1qm0nOddnmJ3zxPmkgoWoJI7hqVcE4AsQs1ow6RU4RZ5Jm/xoOglAERaR8mRSsu08d6LEwvPruTTMU2Hks+Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6881
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, November 16, 2023 1:06 PM
>=20
> On Thu, Nov 16, 2023 at 12:51:40AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > > We should expose a limit of the device in the proposed
> WRITE_RECORD_CAP_QUERY command, that how much range it can track.
> > > So that future provisioning framework can use it.
> > >
> > > I will cover this in v5 early next week.
> >
> > I do worry about how this can even work though. If you want a generic
> > device you do not get to dictate how much memory VM has.
> >
> > Aren't we talking bit per page? With 1TByte of memory to track ->
> > 256Gbit -> 32Gbit -> 8Gbyte per VF?
>=20
> Ugh. Actually of course:
> With 1TByte of memory to track -> 256Mbit -> 32Mbit -> 8Mbyte per VF
>=20
> 8Gbyte per *PF* with 1K VFs.
>=20
Device may not maintain as a bitmap.
I have hard time using calculator for 1TB * 1K DDR memory. :)

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

