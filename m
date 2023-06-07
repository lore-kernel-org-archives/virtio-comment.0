Return-Path: <virtio-comment-return-6221-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0ADEC77B7A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 20:39:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2D967C6230
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 20:39:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D038986668
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 20:39:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 14433986255; Wed,  7 Jun 2023 20:39:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 029829863EF;
	Wed,  7 Jun 2023 20:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D626d8mlokyRAJEg/ho+OER9P0QZvLY4dKEwhmD8tRDKQ+Shgqj/nUVVOEiA13YeCnAZNAwCHZv894LpdkeWYA4Qpv4JrHxygYp17yMwyQKyECo8KKllpuj3RFhEZtX+LYr5HbX42UYrEUz8xVw2CZOhbJtQ0ZyfzAmsXmeLPUF3Q8LxXWWr2cumV00z7/6hUP85JfD+doQh2Px0J0ut5Vzi2uhw4NNZE3nSCWpBCjS03PJSmUvZHp2qbU01cyxeJJkCU/l1kU6dPIA3cxpVMC246Vxu1kBdMlOVLkovBSLq5stFIs8j1a1yOVWKkx0qkrvku2ImXFOgwfRW+U/EeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIjnHGAwzZqm7bU07+QwF75NhpYj0AzUZN4ZKdFmpq0=;
 b=JSXq+imFoyLkvy4WjPaMKRJ5TLb73RzVEOc/rSJc5CUjk0/dl5O+9pwn3vMfI7ZIg1yCgrAb2EeaScNTeRZCa5shI2ibIGKV1wmKwBlX/aTZB81rQ4ncsVgwts1pgCbN+KXJRKE2cAz2y/j1d4DDFrdWyHR7ZlEGSFccamJIp2XJz3c07lvTCu/YzoCGSJRtwytWjvX9EsMBjaMDhZHLwqmkZBgGkA0Ctm2CZJnwDlo5ttQXhsoy5C56h+PhKVOM5cyYzRqo2mP+EuCiZs2NnyAHqGBWfJk9s924FJNI9Np/iE9QUhDi6zNrKW08VQW898NWCthyOLzLy2JM4drkWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4
Thread-Index:
 AQHZlNToe5517kFJJU22M0c8Q1OeEa9+XxQAgAAAfzCAAAsOgIAAAJDggAFqXwCAAABjEA==
Date: Wed, 7 Jun 2023 20:39:11 +0000
Message-ID:
 <DM8PR12MB5480C6DA479E4DEFAC5E1EC1DC53A@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-2-parav@nvidia.com>
 <20230606180853-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4357772DE13272EA3BBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606185016-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C7FC00041476C73C3A74DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230607162747-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230607162747-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|DS7PR12MB6261:EE_
x-ms-office365-filtering-correlation-id: fff581f6-c4eb-4f7d-eb4d-08db67974024
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1rbHdK8/Uql73A/Lgqy4CmBIG9XKM++ZXcpdb0uoEM/wYU36C4qnXQKLKllDFvH9i0jS/fuAUsXuZ0PK3swcWFAXy5WjbPTH2TTUiLeiDqEOqvUnfkvGHL4O4R/TAiSmzz/zqDvCNy1UPFLNL6EshvYYKvRwCZ0XUQbUBiNBYrI/IDY6rw2zkPb7XKAaz6lSyzBA0ZWMjfXUxqIKAbx7dGbKxcaSDxTdFuYb5KS3sPxbkiv3GcG0M5DGwcleVXh8aDbIF6nslxGxLFJslqax+GZlLyVaB5vJfCLXL7p7KJoIacXJ3WtvL9KWb+NKtE/0W9IjtgtN7KQVNWfA4Dsofj/B86TMAdQifXMO3jAdC062RHUG75s6mw9qq6jH0hynJ3+aQyzxN/+KssMj2N7r4b5x+7vKbSGHjMr+jVnnt5fUUPKddCNRGdxOH1D4dNQK/AJyqmpdFuuMIVoG8hqMkitZAhn5LOkB89Dho24rImbT1dixg3RDEeRFQOSTaX5Qc6yrFiKIYnlUNYv1r0XR1vWkcQaOHBag/5FBlv2yYobmLrpjvzuQhSC59oVrEt/tpJQA1pbYoUF05krG89hV2p9jytTHSdhKDFRPeAfvf/slCGY28isF9ytPgxZnfrc5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199021)(8676002)(38100700002)(122000001)(6916009)(2906002)(52536014)(4326008)(38070700005)(86362001)(54906003)(66446008)(76116006)(64756008)(66476007)(66556008)(66946007)(33656002)(55016003)(478600001)(186003)(71200400001)(9686003)(6506007)(316002)(8936002)(4744005)(5660300002)(83380400001)(7696005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5DlWaYjFNYDN3H79kZkPBU6jp4sQOFDMz1Z7c4aOmPZRTunbGcxhdM9/Ea6a?=
 =?us-ascii?Q?cdrnovfccdiwY6wulVn71m4Y4EPBt0jSROiEGZD+PRcD//koWezIRwuItz3a?=
 =?us-ascii?Q?B9W9KRVkqPFYrKZrdfY81+dZZMHmQtzjluMM4CoHZ52kLD1G5rKGsCxQ/WiK?=
 =?us-ascii?Q?tK5EmN6ozkIQPv+Lwkiu8MuI9fsLpQJGR8U+QUnJ/WTuVug3BM8DnF54xNIJ?=
 =?us-ascii?Q?ECcPcBYFLYiEtideTm/KLMGmu93XRwZGvaIG1WbVu+A3W79JyCIk8jdrEvC/?=
 =?us-ascii?Q?ZYHNrD0DdcqSwgsaiNwld6CScPIkQ1B+1SpvVaMJD7tQ2JBHThdsngYsqecE?=
 =?us-ascii?Q?o7YwdgjfIOc9igpDJ/wmA2ECXdbRpTcnvrznjNeL1aEE6/HuQZnK2gjAr+rw?=
 =?us-ascii?Q?Dld4eLNoaVJ4QNkc3LWgUKT+mmNqDwWjzXS1caX9pmgcvLbL+f391jqSOOqC?=
 =?us-ascii?Q?y8o0LVGHiE6qSoZo1xCOanJdCxoGfcBjOip2yldqVodScP+76Rm61TgKEq+U?=
 =?us-ascii?Q?YeP8QMgLiV0UX//xERJNVJa0/W7z26mDY+Nh+E5DHX3rO3IRELoJQ+p+x6Lj?=
 =?us-ascii?Q?+mOcl0qfzRm+KbJgJjVLAU9sCpqfo8Lg982zY3UR63v/IuMjZfpYWweMbW7a?=
 =?us-ascii?Q?g7NrXA5PLqRdv87QTxOnD0zCTh4NWpgsmN59UiLug45yTCK1k+cM2L2buwc4?=
 =?us-ascii?Q?qbEGQj2KyBSWArJ29y5/rROCBXadHk488sTCcHMALul/3v48ZaABDKQ3Mbo6?=
 =?us-ascii?Q?8ExNKfEpyt9NWs3Id9P8/UWQUQDSZd6+XBEsZ+bDlQ61/lHk6E/9TJIht0I8?=
 =?us-ascii?Q?RKdYhf3U0wUIHhrQ77MAywg+aKe1SS4Exwir5mi8Pim30I1FUp0Rckw6dt5l?=
 =?us-ascii?Q?jNYURxCkxBN6Q0Sw0PowtUEvBpJ8iGNsQ4tqxGTIESxu7jVtXJZ2y5+B4w6C?=
 =?us-ascii?Q?+B3q0kOzHKZRUehmEZJ2MlvuVuP3/n1YrlTzAVJFAjAIvKUHZ/3z7MEvMbeU?=
 =?us-ascii?Q?8Qz+a4dYU3NW9wjCgu8ytYO55w01rteEOEcg9Iwg0rLNL4JhmbLt3YIdX9d2?=
 =?us-ascii?Q?f3Pxdk6t9h4C43nRCztDHe0d/7P/wM9sCI4KvjO8OOW3IBGJ/uKBCfJ6flCN?=
 =?us-ascii?Q?C4PUlZV6gFNDeqeG6bAYCrKAi0jFf1/c+KseZobr00/Ssup3uCtRf1u+P9V8?=
 =?us-ascii?Q?KLEfhbvYEQK590GOwW6+yiCSO+m7HT1ciqOBoZT2owuVJ9wSY90odLV3FE3b?=
 =?us-ascii?Q?wVk29EpujICuJZSFILA7r8vNF4KYKzBYS1b4YC2b9FrXPRl3qQw9v+2dB3er?=
 =?us-ascii?Q?cqWg+V7/5ycXyQoEkZ6kACyJTLrzd+wM0QxIZJUNu+/dLxDEGbQ/IjNXyp1J?=
 =?us-ascii?Q?kkogwR38bovA9MhztwtGtOW5yty33ooV1LsQJM7nCoLzjCh66kRSw2cQJnjZ?=
 =?us-ascii?Q?airfb26lGoSIzLgTWXSCGoBeB2e+a6Y7+vlvOQKzomrSLsfj/zmNJjOdiiva?=
 =?us-ascii?Q?6OREk9QXCBNR3V/LAAUJJ8fXnJdI1P1+oW+7A+aaLXIYMbD1o/GXaAT+7gZc?=
 =?us-ascii?Q?bRzZxyRZDbfWCMIAMOH76Hf59v2qsnta4xRsRJ/TG4f/3w4CA5kqEwkaDQtf?=
 =?us-ascii?Q?B6byj8Aho9oBvBW4wyqxaGM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff581f6-c4eb-4f7d-eb4d-08db67974024
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 20:39:11.6657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aKTFV0KFNp1uwURi9RR+5g6rVvK0QwgnFCnwYEBUNAntVEFkjMJZ2boIZfkKNFEVA7A/eukg85r6t+EUKwbxmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6261
Subject: RE: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, June 7, 2023 4:36 PM
>=20
> On Tue, Jun 06, 2023 at 11:08:12PM +0000, Parav Pandit wrote:
> > We can debate and change from cvq to new cfgvq as part of the journey.
> > It is fine.
>=20
> Just to stress, cvq has a bunch of drawbacks. For example it is hard to a=
ccess
> from the hypervisor since it's DMA from VF.
> This is why I think our direction should be to add a vq transport that do=
es all
> config accesses over admin commands.
We debate this before, so will write is below.
> Or maybe I'm wrong.
>=20

> But, let's distinguish between requirements, and between requirements and
> design. Getting supported counters is a requirement.
> Doing this over cvq is a design. Reducing MMIO registers is a requirement=
. OK?

Yes, I would write it as reducing MMIO and accessing it over vq of the own =
device is a requirement.


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

