Return-Path: <virtio-comment-return-6882-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2B3C001B0
	for <virtio-comment@archiver.kernel.org>; Sun, 23 Jul 2023 21:31:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A16802B04C
	for <virtio-comment@archiver.kernel.org>; Sun, 23 Jul 2023 21:31:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8E5BB986399
	for <virtio-comment@archiver.kernel.org>; Sun, 23 Jul 2023 21:31:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 737A1983E46; Sun, 23 Jul 2023 21:31:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5690898634E;
	Sun, 23 Jul 2023 21:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJfEFYHAchjp7GG6cY0oMnXr1EMRlKpmlJXdQf5I60efubG64krGd173TfzvMqbT6uL0YrCAmagJQJxWH3iSOoeCdA6NzpzwQJNXALAQCwE6koWuYHAWKqW2am0vG19YnU05vvkWI/sHXhXJzUC8Hab5liE00p6P7P8QAfzZdfGAQSXtha9b8/lNe6pDNgYkLSlVfSqUhY9lE2PC1+aVpB67lrP9mneOxlIvwDljbSPF3Tym/eh8tRwv2uKH9/78ThW0Lt9AT0JmqotpLyJB5rX9JGcrDUXHuNrRtue1lZ0dIfwCF8+oPNVcMCC00PaptkqaRjWsz5agvtNJwiv2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMwAqKwOdcwZcnf8S64Wjq9TalyJt8S5cZ1DOCPiOTA=;
 b=ekDWjPcl0kOrLz0CuW9BMaD4v9O7A07t+9dqHGAgnDOp/u5dWFLuEb7V0Q4LGaOHSXI/ODfk/GM45jA2ewPuyFNs8C/eYT/fFiuwnMXnm2VPz9rnjn7Oh4L53i+SyKTFzUggdTqo+MPnrIWcH8dVHuqplPt8d5bAQ6BWmY0lSO7lBneOiexxVQj7XiiyhzGOchyKMuF19MA+hwNWgT5tlm1Ym03vgDsdd2i5Ly5o4/6rIxSCm8aucC/ZAurHn49s6yfGzXAMusDrDX3a7Kcrp/ytmF//Vy/in4RAAYbxzNKuy7anhJLV2R6T8meTcED+tI/SOQSNo2VDpE05PrnieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio] [PATCH REQUIREMENTS v2 2/7] net-features: Add low
 latency transmit queue requirements
Thread-Index: AQHZrT8keAevMDwO+0i1fpyKTNQQr6/C4yqAgAUbNVA=
Date: Sun, 23 Jul 2023 21:31:50 +0000
Message-ID:
 <PH0PR12MB54810DD5A5344FE5DB786629DC3DA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230702234410.47546-1-parav@nvidia.com>
 <20230702234410.47546-3-parav@nvidia.com> <20230720152827.GC184015@fedora>
In-Reply-To: <20230720152827.GC184015@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS7PR12MB6216:EE_
x-ms-office365-filtering-correlation-id: 32553b9d-ef90-4819-b966-08db8bc439e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 L1svbRK5Jbq/nDfQhaP8kqq3b/kzirKNVfxVz08cs7c0bujkchenZ1RtDb5mwKrjfZmFQ9Dt/o1UdH7Ku0vzk2c5T3nIQG51eFKjBdCUJTUznQGs/N3h8ImlPZ+1ZbwbKQSyx2V21a+WFvgnQeRn5+Pi1iv0oolsWXBSkx9HzI6WWf+CryMqCI+U86hDFArUZ7gQUCP4C8YocT+K37M926hp5YaQL4ttPX42dznuRqLCinIMtV6pfgXM3OdJRHwoVaHqZ3FdsghIlP62hagwWj5v4Ajt4ouzgumWgpiip2Ckk+WgAZnoImDyf+9pvnpEt12FbpBy842nu2CXrSU8LCcM8lNXeer3gaxTzxS3RC9xdLw5CSgo8aqQcZZfwMi/Ar5a7Y4Cy2vwh3SUm5YER1UinQ83HTCS0gxp082p0HqTLUumC8DQJPH1gb9Xm17gy4jnegIC259JQ/c49D2nIInQppMVe+2lk6cO1xD22p4jENDWejV8A/Rpu6Ud2sNzWUs7Qvj8TcF8rWqtpPNWYyQCZsfZZ0huFDL41PT83CGBGE/pc3qhg9sBrrz73zYIDIFVD88G/moLOiSrvJJha9IcLiWbcd0bWzWUXmtchMPh720Hbf5aqDapYHD4VQtM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(2906002)(64756008)(76116006)(66946007)(66446008)(66476007)(66556008)(6916009)(7696005)(33656002)(71200400001)(478600001)(9686003)(54906003)(86362001)(83380400001)(186003)(122000001)(38070700005)(26005)(6506007)(38100700002)(55016003)(4326008)(4744005)(41300700001)(8936002)(8676002)(52536014)(5660300002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UX0qlvDKSxaEh/OvRsNqn5zPqTtVy4gEMaJt+WFJ48nkIUxkxGZ7K5z8wCoc?=
 =?us-ascii?Q?7iROsSVF2vVj/pI8JQ7eQEVBF26MQ8weI2EI4RPkBjSuObgFFBzU6HBhUPuy?=
 =?us-ascii?Q?RhuMuzp85f9OUF4HlPmZLEvcgIM6wTU61rUOe+x+6owxk5LFbjWsmrrGL/Bc?=
 =?us-ascii?Q?EU38NOTliQIG/Ys9MqYPOwkjbNSPzs3lZQC3yWp2qAtQjRz1olcnre8bt8EZ?=
 =?us-ascii?Q?KkAipCqpbFmBJK90C+7k6ootxVcLXPA6VltPXcePaC+Kx3livYTlMvkXAUcs?=
 =?us-ascii?Q?yVcSg14dDYOO+G6ICalxV3b0UiZkkk95tcWcjgGOoeTqcM/gESEW8qT1pDAt?=
 =?us-ascii?Q?nZMxtv4F08WhVvQQRo+3XqQMT87ZOtyzqjnTYVNrUwmauwWupmiYwzna3dka?=
 =?us-ascii?Q?QPSmdIhoImqlPdYB4u0vIkRqSEda73X8AGUXz9R7smtzcdZQ8Pg1rx/JsPYO?=
 =?us-ascii?Q?gE0OrVLPsTz7SyV/PpXvRDB8f9kpx32Ae2JfbDDoZSiRPKBgNNh0Hhg7TUoR?=
 =?us-ascii?Q?lsKsnzylbYhMYYjoGQKpizPUa3JK10644d6CLuTHEI3DI7l/yqjhXxH6r1Ca?=
 =?us-ascii?Q?95imKcHNz8lTNuqC6JOtBthidusIcvLUgS5x2fiYc2tsDY+HxBIuqka70/Ng?=
 =?us-ascii?Q?qX5u8LSXNDHlnBk3hslaG8x+T+WECPtJUChIT8vg7RYk3V6fFKmtsRQOJKvL?=
 =?us-ascii?Q?bZjKS1xcWNghSBJlDV3+1JfPQV0OAb4FZ49MsYNb0C80bJt1NNt8RMZ5BzVt?=
 =?us-ascii?Q?sWGVCpmMXweuo3Itu7Fy1IKX2SMpV92yZSqFGMwbMR1mvMRhuhg6IUvGsy6R?=
 =?us-ascii?Q?mWvXPciGDKcC79Gd+0umWmudvX1oynW40ryRtYR0ym0/JRrW6nwgW/65JRD/?=
 =?us-ascii?Q?I/NkCPg077X9l+HoarW5NTAE9hO5Uv85V9anKHXhUVk8CzSM8ADmG1Too+wu?=
 =?us-ascii?Q?hMMVpEAhcnl5BKNSW1mPWRT+nb4LupKBJpPgmMvlfjWIc5b4q5stnne8NEW/?=
 =?us-ascii?Q?BxJwtdZ9HEu3VHgWikCgrzp7KjQEWtaaWKhSg31vAgKQAtvO0EbpuDQK4Lp/?=
 =?us-ascii?Q?fThe1Ez94On3LK54VJZDRQOlyojY+DOqwcslwmKzBxGTcD1W5xKAo6pddvER?=
 =?us-ascii?Q?ROfHpSeUpoQP7unVecJuzAZYYQ+rXsl2SGs1L8ZmVw0Ki4DCU6wwrJDpx1KK?=
 =?us-ascii?Q?8ttY283aColktF+hncJCkOB6pVLkYdo0JbRvA/rXwrtUxPwl0OH3xd28NloU?=
 =?us-ascii?Q?lrKQUv3SLuW184+KucTKivzv2Ij4oYVetj+edX0CDbfUag0ORVrGEhRIXX20?=
 =?us-ascii?Q?Yomy+AnM+qG8NE8AuOH2Rg5XAs3alpSNKMQYSgjBU5tBSxP2ptrrlf1MP2SN?=
 =?us-ascii?Q?dnaBY73xTFM7Gzri6AJl2srqAAfU+ovwmuDy6Lx7w4hYQKjjIfO0LqH/l2ZL?=
 =?us-ascii?Q?xmvplQXLH/U/e8BRZNg77iqkRUx2df+IM33idiuaIHXvipnGsOmbWbf8Gxlb?=
 =?us-ascii?Q?+Aj3E1TDkBWercsIzmQIi2VGbhMAWJW93IAeyYrD+Tl9gTIX7CVe1kv6mbfj?=
 =?us-ascii?Q?vqZxIKWFS+foy6KeZVQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32553b9d-ef90-4819-b966-08db8bc439e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2023 21:31:50.4089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ZA4+SMr9GZDOnRKaS9T4KFkyoSalJal7XZbH4lv+fnFhfNwVWvjGEg0dUpZFIEtbyFNOg0xRTcrziaMjldluw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6216
Subject: [virtio-comment] RE: [virtio] [PATCH REQUIREMENTS v2 2/7] net-features: Add low
 latency transmit queue requirements



> From: Stefan Hajnoczi <stefanha@redhat.com>
> Sent: Thursday, July 20, 2023 11:28 AM

> > +3. Packet transmit descriptor should be able to place a small size pac=
ket that
> > +   does not have any L4 data after the vnet_tx_hdr_desc in the virtque=
ue
> memory.
>=20
> Please make this a generic virtqueue-level feature. It sounds like the id=
ea is to
> vary the vring descriptor length per device type and per virtqueue so tha=
t
> headers and small payloads can be embedded directly into the vring.
>
First sorry for the delayed response. I am still recovering from illness an=
d unable to work consistently.

Yes, should be possible with inlining the header.
Even within for same device type, for flow filters this is needed.

It largely applies to requester side queues like net txq, net flow filter q=
, cvq, blk/scsi req q.

Thanks for the input. Will update this requirement in v3.

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

