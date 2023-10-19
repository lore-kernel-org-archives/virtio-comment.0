Return-Path: <virtio-comment-return-7865-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE418CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 10:01:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 503922AFF6
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 10:01:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 45D2B9868E2
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 10:01:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3CB489868DA; Thu, 19 Oct 2023 10:01:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2EF3C9868DB
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 10:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMWnLlfnc5sDdZiXjriMwwWv0VzdiL2lrpFSVjITA1NPuATvZI6+X0A1pOPiNhZi3th3RgYLZ9wdiXuwOlA6FAPoeK+JGIy6cUcbYkqgdxybXSUU+8Zg4M6o4+qETPcrJKSKqZpRh3ki61cZOYO+cfqNKmijS6wSmUMhKLGG2Nx8qEiCEH287pKm1D4L+KUUoIEhp2wBl/0BoQ4Wa+9rOPnizfzMGhGDEldQPmMO3Bk7Qm2zUpCJYKl92X87Hi3Wm0YrZa+VnBVY+8YeaV42IBNE07Yrd2eTFm3tbMEqqq/31MgT3AFNb3QIHBqhr40ea96ng0E55rnvwYJDjox5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubFnzSDRRj4WVXhpmw5QiH0XKcQw6my8l+hNJ/WsiaU=;
 b=hLyvFwrKG4czEM0n/1+WkC/VkNWr0/+WBTAiwaU2HBwcqcRJDo7sqW0U1zWLiL0WhzlShdDSZJWsq4YYxjQDSlegtqF7ZXKnjqiIn1x7og8RnSY2ThwNxTZp6vUkt7ZkXj9DsS4DTwAYDS6O0GY939lwPF+c8TpXisYRDkda93bsPyk/DiFgr8Qcd7SMJZwoeV22sYlU5FCkSAT7bzXtEO1h5RcVl9c1R17U7Ezjv3STEJ22qWOEA7hqH0NH90vtenxrXx04tw157H0X5V/R4IY5E0Pt3lo3+6AAU1Q+fXv0kihiOy6rQR3qmt6F3h2bwusWuGktAfS8/iK6YSFGbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCAABMfAIAAAMfQgAAfqwCAAAPbEIAAB1IAgAABSRCAAAMRAIAAAcwAgAACEDCAAAORgIAAATbQgAAAzsA=
Date: Thu, 19 Oct 2023 10:01:09 +0000
Message-ID:
 <PH0PR12MB548145A15267207235B37403DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019020413-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019041629-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481373C657AE3EFA123D1C4DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019050553-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819E1EAA41F3CAE420942ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019052328-mutt-send-email-mst@kernel.org>
 <20231019052725-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C638743682F55F11BA28DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019055251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B1E4590F01F3EE16ED15DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481B1E4590F01F3EE16ED15DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB7927:EE_
x-ms-office365-filtering-correlation-id: 85221ec2-cd01-4566-dd44-08dbd08a51c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5Z3RuMyolWDX+A7at0qK/KRzqp5BdnznbpwGkgsNcuTEb7rvq0x3WLn8aZTW5nI03Ff15KF0r7sxfivIP20249b5qNa7qUrSFVgmzW+R7nKq7pyrt8nvx9aCk+1Gt9ORmuGsCIAIpyMW2DCnzcbJlXx97xkQ5mMfg5SVZnOcYnCoVFDB30Cjw4MnFY/t+eLlNCcF6EtHPXAtUeILxS2dy7RxccVQ4Jm8eWn8yeZeqm1QTOkjX96sDxZJsjzksCMxEwNC2sU544l6OsmmpnJ8bFaX5TYjvqo1qez5ckMlk12/NimZhokEG3bkebHrOAqUWRYXzslkNtcS2Wxh1q5dTolejPvQsb/tW7pgi3CgEAlgY72/k4pCXlg0ut83UARSGo25qXC+PM4xHYsyBSCF7Ne0oHVvPCzelGzVy9PJq86uAz5yek22Lg/cnJ/r3H/AZZ1Qh6yVvMXC3UZcY9cfrsD5O8Qcb905qlKqXrn/zy4/IY4ZoVvr1ArJq02Y35zP/nKqzb3TsVOOCIth7FRDZH2wukYJ6BuZxl+H5aV7YmC2rQGuu3onhztB+/+zIzkBJjVpuqdViWPXQG8weMLGjCox0qV9yAF86jTxGOeF98DshaSokphIRdcJqdnzG6fQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(136003)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(55016003)(76116006)(66476007)(64756008)(316002)(66556008)(66446008)(66946007)(6916009)(33656002)(8936002)(478600001)(54906003)(71200400001)(8676002)(4326008)(5660300002)(52536014)(41300700001)(86362001)(2906002)(6506007)(38100700002)(38070700005)(55236004)(107886003)(122000001)(2940100002)(9686003)(83380400001)(26005)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dDBzjeL99VT34PBLPdXqn4jpFKXpwPHZfIrsC4FVW/qRaG+145uqiEfjTje1?=
 =?us-ascii?Q?ebyATYo/FNbqghH/9kKGVD8biStZyEJk5y1bplqRpJMXWBZtuzG2hBR/3qmZ?=
 =?us-ascii?Q?RlAMCBTXbukQ/JKldkxFNMRoxXLOZcFbdLrhF6RJWgFMTb+1997G4e/YEaAK?=
 =?us-ascii?Q?vBh97eNxaQuesCyCiJflIQd3A49l2VD29WSX6DodZrHsTLcSvp8UB961UG6d?=
 =?us-ascii?Q?sV65UGQUKpdaVjOTxZwYKGSGf1defV6Tj9neB2GUNyB67TIan6SB+V8YMl8u?=
 =?us-ascii?Q?dW4HiEgtK8wW8gUQf8RCItl0/1bS0B4ECJi3+Yx/NtYwly630Y6FbmNRWKwG?=
 =?us-ascii?Q?YNP5muQauKk8+wTVPjWXzU19uWfsMA4ebsWC+Hv3JZpbj76Vjjub/onkoiY1?=
 =?us-ascii?Q?pv9TGf76tpXOpGF4V3aEqHflBLV24pQYO7spUvrre8jvYQZA/eSijwYiaVOr?=
 =?us-ascii?Q?Fhd09M/MAJ64+MVWqJCO8/LYaebTfKzj8C2J8HCpYjn8o+1t2KMm1RIgdzki?=
 =?us-ascii?Q?ack4MV4bzoSjgqT9eJVATxFaUPldm7NASPPBjSFeVLRuMwybMn0rdNNF4l/L?=
 =?us-ascii?Q?QrjSnHWncpvd3IvpFKSoAW9ommPtWc8nBPNA+d6ADO4fZ96QLEBqFB1r6KiR?=
 =?us-ascii?Q?LNXyEyORAzkqb7jZ0/K7ENF4XDc/z/2ROIwtd+CIrxvxWp2DqVS0L1ReetHD?=
 =?us-ascii?Q?aOqQEBJvrQAYL04uXMckiw8Rsq8Q250LB1aoPTiBlnvKzZ8GjtifUY49Y6JU?=
 =?us-ascii?Q?MONwkVsGfrHAUYxKXIi9BI+G+0kU4o+m5Kra48KMKpOK8XW5pQ4AvXXoZ+xP?=
 =?us-ascii?Q?4ipZWsT0kdGd1vIJAQITWTEI1jct7GntIeBvE3QomBcMK4H4WraC2nHavRO1?=
 =?us-ascii?Q?ONSGmfnyCHYDCLlD+ZccZnk7MOAkDcbCIlD1QRlD0XY+RenViAmqV73vJAPe?=
 =?us-ascii?Q?vknLKJQl720k7Bs50PKlPpwN5tqpDud9mbUFYUVaIktrERELzYj3IgHux9Fw?=
 =?us-ascii?Q?hJl2/12sDvjzZBVpZE3j19FTm3Kohmrtr4wGLsYmrIEAgn2D9ljnIjeqx4Ls?=
 =?us-ascii?Q?0rN8YsxbHtZQEmM+PplhQfMm/McOfvk6oqOdfDCy9LpIyNYvR7QKmAZGFSJT?=
 =?us-ascii?Q?vEjHayvPmvmLR/e+QwIPpth1+f3m82KUMyj4DnzcK6alpvgmoujsEBdqYznb?=
 =?us-ascii?Q?H2g9cXOGuTDr26RTUwRFZJ0QZZyw5pTnwZMlEujnF6/JTfR81e5p0UyEz1IY?=
 =?us-ascii?Q?r0BkloorNXKzzBGUelqsSa9YXXdIURSHvbch5YRBjCtrAW97rikskgaASF3I?=
 =?us-ascii?Q?y4F32V4oF+7YgJwv0HVgDRJXUywRabvKhc8yoNkNyrXf4/+0uHMgdtcetGIj?=
 =?us-ascii?Q?cLfjtaAXTyENjw9OeAc/VpNGcRqgbJZxanUbDH6wW/05AorlvnEexNRJY3fU?=
 =?us-ascii?Q?OjQNOa/ayc+2mLjWWnk27nB5uk5m5rAgXDXqfK0F+CjHZQ849KAvNADXjoaf?=
 =?us-ascii?Q?0SsQCShTAkRE8XUF0cKb0u74MFDPcAsIUngyh1vfJe8lQEYiZa+CwtBKBpOO?=
 =?us-ascii?Q?ALHDTG2Raxz4k3sUESM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85221ec2-cd01-4566-dd44-08dbd08a51c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 10:01:09.8866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rEiznlmHj6ccYfY315AyUzD4n0PkSyxy0b/y9NAYozVqMx2wEg79vszt0frC3YnP3GDtmXxgnNWOuIO6N2bBHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7927
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

> From: Parav Pandit
> Sent: Thursday, October 19, 2023 3:30 PM
>=20
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, October 19, 2023 3:23 PM
> >
> > On Thu, Oct 19, 2023 at 09:41:46AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Thursday, October 19, 2023 3:03 PM
> > > > > > > With a capability you can discover it without poking at featu=
res.
> > > > > > >
> > > > > > It is discouraged by pci spec.
> > > > > > Pci caps for mostly doing very small init time sort of config.
> > > > > > Not to run frequent commands.
> > > > >
> > > > > Interesting. where in the spec exactly?
> > > >
> > > > And the reason I ask is because I'd like to understand the exact li=
mitation.
> > > >
> > > > In any case, we should still maybe look for ways to separate it fro=
m config.
> > > > Maybe a capability points at a BAR and that is where we have this s=
tuff?
> > > >
> > > Yes, I replied in your previous email, a similar suggestion.
> > > Lets first agree that it is drafted for non-passthrough mode.
> >
> > I could see passthrough use it too if there, why not.
> For three reasons:
> 1. it does not survive FLR
> 2. DMA occurs on the RID, A vm can directly attack to this programmed
> memory address in it if done without PASID 3. PASID is not available anyt=
ime
> soon in virtio 1.4-time frame on most common platforms.
And 4th, these new registers do not scale at VF.


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

