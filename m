Return-Path: <virtio-comment-return-6971-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9530EC001DF
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:58:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E70FA8682
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:58:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D8428986649
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:58:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C6F7398662A; Wed,  2 Aug 2023 11:58:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B565A986636;
	Wed,  2 Aug 2023 11:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6gW6OFPCWGXR1wQgvFiEseWjwfErJwCn8AzGv10EWct/X6/8vxNmvXEAKQboUCRDY04A+qrB3vqdCysxBQTXC6EGfB6BK5csKJ1opcUa1Clc8zIZGVMr7NA7sF6YgYf1jAFneAKHYviGhA0pORBtBN6xHslO56zYUTzo9TAV6jjoCVy5f1aRSQbHxWNN176sr7NvazZUmgsAFGRwh3te2hdz/Myv2iMj6XDFlYsQXkan8KnMGu2/o6GGi4PjyRcRCZput+WHlMOnTmzl3FZsRjJI3gorclu+D7SYkjsglYdSubI6LP/TqbAjiPHYr6AhGs1U47BlTv3ob+vBc6u8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yxnuiALN9aDy0S82eixor2LVh26e3lz6pszhnx0US4=;
 b=a98Qn0bVqTtO9i0t9rTtUlyB4cucAd4a5s6yvKm2ss/M9aAISv2LVj8T3qn8zqOQDpiHDjzMJCGK9nlGaA0SoTskPRHR5X4pP6CMUKzHCi5wU3zdmdncw5fLJAIcjL2ud/gUry5dJWTa5QZQQLfM5iwk2d70/r94zEkCZO2OSZOG9OQlQ+3bGxUDoNvo60SEKYZauHOX3iDR7B34xUHyfP9+5/3vHgViHZ9GM6FUF/n7yrW4NIlQ1YnR6Fno0uDMKLAO5Cn5N/nSGDtzvyATY0LFKEKQuk1BmZ3LXrZneRF6HsH7bFvRwQdHY4eqxdLHnMfo3c7Gdtui/VVR1yjkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>
Thread-Topic: proposal: use admin command (and aq) of the device to query
 config space
Thread-Index:
 AdnERrUyzvIBkM4LRwukraLndwiuSgAseh0AAAlA/AAAAFJY4AABoP+AAACZwMAAA2VdgAAAXSsQAABHyQAAABdhQA==
Date: Wed, 2 Aug 2023 11:58:31 +0000
Message-ID:
 <DM8PR12MB54800DA6273ABD4019720C79DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802000955-mutt-send-email-mst@kernel.org>
 <3b88c1fe-a5c8-7bc3-b30b-5babe741ffb9@intel.com>
 <PH0PR12MB54813732BE7EA68DC440D981DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ab1aec70-2016-dbdc-3707-c95b185dc1e6@intel.com>
 <PH0PR12MB5481E0E5AFEEEAA10FDBEFDADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802073108-mutt-send-email-mst@kernel.org>
 <DM8PR12MB548060C7A27EFF9719FD1987DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20230802075306-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230802075306-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|CH3PR12MB9100:EE_
x-ms-office365-filtering-correlation-id: 5073344f-3501-40aa-9177-08db934fcaa0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cs9QFUzW4aygCw5Ft6UAy+Wr+RWYwjo0g4AzxqS56IIgoDlPRrlEU0ehfUAeVRH3o43GSiPjGZ27lsweGxFOvSCFntPJKA4tCeh/Fla9TMA+0Asp3qqsmiJYWvBTGijF4ob4gGfo3ZzDAdTXOTiGmH/Ptxxr2dS6tvXGK1eKfiS+p38YeMoMKDqwYoIuG6fTAcYkKT9AC2JWCLoG1z1O6WTLCCzAYqyfIXzBdS4h0PI6Myg5UZB/wm0ZrVGeeLlf8aHL6RwP8IxalpdAmf6saqRG0vbvrpWbkCZEehYRZi0eUR4btQoVj0+xCpOuUPHo63MIQIbqqBoI/EnuXmXiIZSOi4xbclV9dB9ix1ewg640eaSf11LZsp0hvNKTnjcuWmBr9jHSy+rOf/hYfEuKD9Ujb8SsivuHXY7HI0lIQO47/5xkPIoueMRHxvYVveyCL+H4iFdNwdQ/raD8VwG+4nLExCd8B/lVF6UUAfkQupkUvleHoHP40fKW+UgVPozJM9ROXF5PjTE9iHEYP+xd/Yl/gc6bvM6refQANoa17Ysh408pAjasoJlhncHptIBCeN0hLRM0UWO8Ev4VsSvz5kNx8vr7fjLRzsF9gDSpgFa4gYF3DO3KPpQvC65STn4Z
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(6506007)(186003)(54906003)(9686003)(122000001)(478600001)(71200400001)(7696005)(66476007)(64756008)(4326008)(66446008)(6916009)(83380400001)(38100700002)(76116006)(66556008)(66946007)(5660300002)(52536014)(33656002)(4744005)(41300700001)(38070700005)(8936002)(2906002)(316002)(86362001)(8676002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DhrR7luOlduAOXO+ZPGmIuShvcIJ3yEc1B/NP9GHrVVMlMAwXh8XsknBYzyx?=
 =?us-ascii?Q?rbuNjVAk0COxKEM6OHH3zavW7SuIaOIcJzdT8kZMMsWvrjFqz6gih68aN5yN?=
 =?us-ascii?Q?fHdo7RhBdvVKO7XfMVMtKDZAfWTr6QThgQKaxZrOLjH8QHPAWZwVtt48Z2Iw?=
 =?us-ascii?Q?vkAmAWZuoadG1jrY8cCnuEQOUuGNIYqsSCwVSJyjotKRJ3xmXynjE83aRv38?=
 =?us-ascii?Q?tlsOLTzMtl3u2nPcKnuH8CLvoEBoSHJq54zjD8ZXE0ni/aK+o8MMBqCNJLR+?=
 =?us-ascii?Q?tSwr4dg7AvdrPZ3SRu307mhAxYwx6iV/mYhwvpvErS2zG4sIdB5zApqXLjvq?=
 =?us-ascii?Q?STI80/KXf/HJWYXFcpKWE+oLdUoXwjws2p/WrCsBDSd5LUoEt/OdGeAjjGND?=
 =?us-ascii?Q?robtc1tM6RZgwPiGjOjAZYMSA6+ZUTjhHdINez9cQvT6AUekYUjxUolopAhi?=
 =?us-ascii?Q?8PG/FTagf/N3mw+l3jx+YhKB2uq3Ncr5rSdesk73bjpp1/x/edvAtpHv0gDc?=
 =?us-ascii?Q?aUOQWIMx4KhkGdGYsfvAd1wkUlEDN5ZTxZ4dlRGb7PkbUrL0vAKwqzhfZ+J7?=
 =?us-ascii?Q?+0iyiXeHFdybg1rzoDQFDAx1Xkj1p6sDdvBWoWIX1wNutvmvc/IQMejT9WhO?=
 =?us-ascii?Q?rO/kk7W5m2yU75RvRlOTHq/WiXTCoklOyo3uNx1oVn2f1qbJvvrjqK93TTLr?=
 =?us-ascii?Q?YRDG9bUDn+Tv4TS42tWjbwmNYWYuDvshe1bK08wjsT8kJdifxDYcJk7BDbs+?=
 =?us-ascii?Q?Z34Ct/JJGHrMnuCHark9kIMshnH1AoXJS4ovR+pRHHEqDpQ+SFljN8LClOZJ?=
 =?us-ascii?Q?VSZj2qzlIz2ohcze7QptPgO9j0eW949lF1xp8fiwS10Bj3PtrioJz8L5B1SJ?=
 =?us-ascii?Q?tHK/uPbZlafyTRit44gAYKv/PU5abE88dfiPjoCZL5a/rq4DWf+uKa1guv1y?=
 =?us-ascii?Q?eM49QxeTdihYa/ZZRr4MCk26pPE8q/sKId+JitTaNZ4cudhNaAk5SiyU1HPz?=
 =?us-ascii?Q?2CX6ovOmvEdugEUVaEa9g2Uh+3lH3pPJyVCFazeJko3tMxbh5yVCQYR+ajlZ?=
 =?us-ascii?Q?gvaAPSgRXuiYWRQTZZqgNmVnU2mnrDoh1zAI0Ha3xDhdm27MYxIbakhraRpq?=
 =?us-ascii?Q?dIR06OCZ2kZQO7lbikbUTFRn0A0iuQ3y1m17pXsABdW/PpHKNHssO+T64Q1X?=
 =?us-ascii?Q?1K6lAONu3Dys8TpPfXiiEfuOXvQgGyvTs91xWmO/paagErLMiz0VqRdhpKi/?=
 =?us-ascii?Q?+sOwmK+5tTTudymQ0YWFRHhEe99F89PfPpUgyOAIDjIMEV+QUG/+6Yg31Y20?=
 =?us-ascii?Q?r7dcmDFgepHsA+xwQF4dbJG/oVgXl0mmNEXCjTAkE6syx5HpmrGGQxdBUr34?=
 =?us-ascii?Q?2OxEqctxrtGfebcNdrGm6vyM3rl2xO0gxQWdz1CxwLyF+MTdvfGFml9gxviq?=
 =?us-ascii?Q?VJsA9qRxkO+gvWmUxv+ru/bb8zoSbDe8kGl96okZ9PqF22aC4Rt9x6xY1d+g?=
 =?us-ascii?Q?2bpHPHEqokQf5CIRnmj2Sr0zEOB83VBvvc8DzYl2McCASbVdRDWhyayTG6eT?=
 =?us-ascii?Q?svm66NRSKgMz/qcomKECC/XhiB6zr/eFory0GRGWez5Jr4aWUCoF3WrBEEIm?=
 =?us-ascii?Q?Mvtc1c4LsF8BQbd5zu5Safpma06JkZQYPvRLH9ua7ybi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5073344f-3501-40aa-9177-08db934fcaa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 11:58:31.3814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qqsRQXw/oalP/7XHqWsjPrqRnEPvrU2HMg3x1N4fXsEnvUse+IVj2jxYBMP+RAUvkNUMeF4q74dR9WNhv7Skpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9100
Subject: [virtio-comment] RE: proposal: use admin command (and aq) of the device to query
 config space


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, August 2, 2023 5:24 PM

> > 2. Build SIOV device ground up that does not need to have existing limi=
tations
> of 1.x.
> >
> > The transport VQ proposal 4 patches had heavy inclination for #1 withou=
t
> mentioning the real objective in the cover letter.
> > I was proposing that when virtio builds SIOV device it should start wit=
h #2.
> > Because #1 is sort of handled with sr-iov or vdpa already.
> >
> > #2 is more critical to get it right, after SIOV R2 spec is defined.
>=20
>=20
> Can't we address both? E.g. use a different group type.

SIOV device is just one type, serving two kinds of commands one for support=
ing backward compat, second for newer interface.


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

