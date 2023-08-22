Return-Path: <virtio-comment-return-7216-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2738FEE49A5
	for <virtio-comment@archiver.kernel.org>; Tue, 22 Aug 2023 06:12:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4E8E02AD4B
	for <virtio-comment@archiver.kernel.org>; Tue, 22 Aug 2023 06:12:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 30A229863A6
	for <virtio-comment@archiver.kernel.org>; Tue, 22 Aug 2023 06:12:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1C639983FE6; Tue, 22 Aug 2023 06:12:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0969A986351;
	Tue, 22 Aug 2023 06:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECNRCVYPav7xbTL1/yOiTGuhXXiVUeJ/g8K4XFq3G0ydYSx3VZdGHzuLgjVV2StPEP6NPGLXUR0UaaUgS76kKB6Gp3Su9ifJdol1y4aiSrPkzwjMGHzbHPRtctzur60IQRw7nN2LREKFB+K2IM4brijETPRwKDRUIiqEd+jKdrftzUKs5nyTczt6GSN5JtL86hJFgj5+YMUzCb+WUO1/B7vYgfykLJiw51lampQv4D5AHL+XMuEd1r1xQlZynRub+x0J69itA6kJJjJoaniUF2tCkBgvzsi60XnusD8B3sdLAuOS7c2ecyY84LpKzLIoDPRFXJCvjcXJsB7m8S5vmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXfHpdCQ7ONi6GqWQ5e/R1MAqOZaRtVMSwF6s9DiLe0=;
 b=GFMdPaxY/ei1pjq6yrG2DINxdNzFh64tXfFBZNck+0s4Rkr9t5AppBSYbgaF0632jdIGn9s37xCjACjh2iD2RhnfI3pVRDiB6oa5p9uLN+BPw6dqsKRN4ycvnptAw5AuzrFAzrHMgMEVjC2dWtwurFQx/Z3S83M1+/K6lWw+Mnn41BhJlh/EQzMwZbExf/bsBsW2bnXfTNH1h/HacHvqyBnPU/KrjjvTgxODpoRumdoLW2KVLgOIJAHxFz2Ox4YwVfEjeCZxkTIa01gtXzb9Lyvq/LpZApOKOLgap3z0SCAH5AWS4cKXLIq6QV2SqHXWthAd722dfS3qnRuhi9b1jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: David Edmondson <david.edmondson@oracle.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH requirements v5 3/7] net-features: Add low latency
 receive queue requirements
Thread-Index: AQHZ0Y2OPkkXezMnckKK02qC/AGzna/0lokAgAFEUbA=
Date: Tue, 22 Aug 2023 06:12:05 +0000
Message-ID:
 <PH0PR12MB5481F8F1E9B578038E216536DC1FA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230818043557.496964-1-parav@nvidia.com>
 <20230818043557.496964-4-parav@nvidia.com> <m2zg2k4qog.fsf@oracle.com>
In-Reply-To: <m2zg2k4qog.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN0PR12MB6365:EE_
x-ms-office365-filtering-correlation-id: 017c62da-ff63-463e-7ac2-08dba2d6b5a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7h+1PME82Gvowzru/HjszqvL7WQGpewf9m6ZxX+73Sk9AnaPLiWUCAQ+RE8iolq8Ye319HsL/zcIs+jaPwiz5g6clDoU7b+gAD5+A0JSz3cjmAa+afdrehGs9fYGhleVjNxIL3KMrjihzJ5pvBNDMHxtyRh9e4UGciWJz4R4aVlbw/Zc2QsSZCcvSmnJeiyl93etSbeNWel+s6kaRj+Yhq1yMTXNQDSCSZDNAY1obm4U45Gz33WG0Ssj8lZJ+HncHU9aGz6I2WxMl0oVK5634kTLcJWXt5Rur1NtjhCROrsNYXcP0gYX9TAsIdeOgfrTQigoRBF21iv2dsmYIFGyXVtVDoPjMAHf1UrjiMJO3ZHxjaKXW4XX97YfS9/nPcT5msdCJlJznfF8Pm0PFccNvW9xioOG5MoKCkFVPobO4uo0mHWSk4khL4qeOfoyXRZ7eQBSTriDdyNvOv4vIJ3o+RgOkli/+Jl+TDPClakx0XJUNpr9WdrqRWqBfPb7KRD9kav6MDIKvi+yihFr6MsJNpRqgg1lzuqr4kOV/RCiUr7o5vu35EZK65zBZ7YTTYI8T62L/CY/Vt9PFtscJRplFNy8Vb8t6xZIUkqzkxrTFV/WWn1ygvNrgp2vFOFdTACX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199024)(186009)(1800799009)(86362001)(76116006)(5660300002)(64756008)(66556008)(41300700001)(33656002)(66476007)(2906002)(66946007)(316002)(6916009)(66446008)(54906003)(52536014)(8676002)(478600001)(8936002)(4326008)(9686003)(71200400001)(55236004)(38070700005)(7696005)(38100700002)(6506007)(122000001)(26005)(83380400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wWTYd/MGwrcOxHY0U4/x63i0Mhrt5IaTBart09UwzsIjIRKoAjX8SW6P2Plp?=
 =?us-ascii?Q?TgEQNl0XDRi22lT/D5vUK/DDh1im8cFrc6YgDAmFbyI91wx5tFO/r10sSU36?=
 =?us-ascii?Q?c1h8/vhsMipp0w56krw3ZUhA8Gy7GhYjBSA8/mv6t22T6gJ8o1RhaN4RXQbE?=
 =?us-ascii?Q?IClvYgMUpGiI5f54jzUQaX7UBFT4nD2NA5uKJXpES1UJDNRLT12kZv4wzLiW?=
 =?us-ascii?Q?kFcahQE+f1Qr0aHmK56CM6sHr22NqiXGucC9jhE7xvOpl5y5bytFvuIAgI7E?=
 =?us-ascii?Q?DimrBAQbRSvo7Ucij4UDGuGJvN809B5s2PIcVzF05oW5pxzUId98klodJpsB?=
 =?us-ascii?Q?c/HVSp4PwDz7XaNh5MznvWsk7euM83zxYEIxgTN8CQGe6KIfTLb8D9IOHh/b?=
 =?us-ascii?Q?2M2rNoZHrAHvYj+bHIPsHXEvkP+quNWHBmH2c9nQkhUmJ1BhuMwTWxrrMFXu?=
 =?us-ascii?Q?y4dUpKweykjmfVHpruAszOVyQrTiaPyOVelNG6qD/SEd8mlpa8Rh0h6inlX9?=
 =?us-ascii?Q?9+BTWufYr3AYhjV1/hZbMNsS24nfBVQPAsGhVX7gmTbjgzlvesPQhbzgtpWq?=
 =?us-ascii?Q?0U0Dq50Zw0HtlQRwvYwTBtHv4ZCav4EbwJntBSQg0yJIIGrivKsxNtmYEyMR?=
 =?us-ascii?Q?xs9XG9WBjdi2QEPMK5Pq9YShQiMK6V+fhg0WfNoAf3M5v31LxmCHDO9HxFBQ?=
 =?us-ascii?Q?DAMfyI4mxk5MoAtYTs9IFAOTrPa8BkkAcx65GOMLzPfAnuKgFW0u7raS2/H1?=
 =?us-ascii?Q?ZivqtYZWWVSPVjPtzxJ2whCeUUCjlVn35IqC/uGSu4+jgiE6MoGRZy8DAGNp?=
 =?us-ascii?Q?94BTppApErGCQXoynrPO7LYkMKrcXfd9U0cn0DRtAUgP7KQGqpr91+l3rZx2?=
 =?us-ascii?Q?oOzViDW3If8/8sXWs/5uXaAyLYCgSHex+9KgbR0truQylckd9Xt1FcH3DWYH?=
 =?us-ascii?Q?c43EXG30vs07UbyDKJfPzhIB+4DsBmIbrLgSCKgUW+OcfaIJZBPDG6kJLzn+?=
 =?us-ascii?Q?L4aMQnMgIyIgBRMYChoXH13ofjPNohKSmjOoEkvVf70Dyl+Vlp6qbugEEwk3?=
 =?us-ascii?Q?Wga2wn5/RPoiUFPRA22CezulwrXmmJ9kXSnwA5CMFMV4CtWTEX97L95jsDnR?=
 =?us-ascii?Q?jpTtu7v+nN6W7dl45vznF0ROFPd9jH2avjyi4VCDXg/GJvRB1O7sw+QmciJU?=
 =?us-ascii?Q?wMhFo7kPOjWvPRMQUBepHvOwl/jmY+QpicgtRKqrwcCVM0dbj97WT9P/ZGZB?=
 =?us-ascii?Q?+yrbcFTcSxOl9m66osJ/neQoQDQ7q5a3oPUeddCampR2v/3bpSwodV64f23d?=
 =?us-ascii?Q?OsnVl/hCKdlO17e2H3NnBwrOZODMKWDDRQtRyjEb19y/pSYoY5kZ9/a+kkm3?=
 =?us-ascii?Q?orYgawOELesC5RhL6sAPu8xSfmqCtbdDnv0zDU4iIwKG2CxpZ6JfhUr6lgaI?=
 =?us-ascii?Q?57f5S+JheYKiYQSdAs7KVXx8fz5qCw4pIyOrzZ7/fSZoSQP8IkfHryX6EtAL?=
 =?us-ascii?Q?zKMnWNKwtZJgBnEaG9RGTQAbcpjgNNT6CaHNEZA41lCkGmWbcUbc/PxT4EMO?=
 =?us-ascii?Q?TGKF+kvJq9EzrZCJ4CA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017c62da-ff63-463e-7ac2-08dba2d6b5a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 06:12:05.7276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vzfBlTB9UO7S3CHcCcEhIHDjrO+edRQQ8Zh+ik8ds4Lf+VrnlSKY1vAWkwYkubgEExx6hvmImUwut986zdqHeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6365
Subject: [virtio-comment] RE: [PATCH requirements v5 3/7] net-features: Add low latency receive
 queue requirements


> From: David Edmondson <david.edmondson@oracle.com>
> Sent: Monday, August 21, 2023 4:17 PM

> > +### 3.2.2 Low latency rx virtqueue
> > +0. Design goal:
> > +   a. Keep packet metadata and buffer data together which is consumed =
by
> driver
> > +      layer and make it available in a single cache line of cpu
>=20
> Phrased like this, it seems to run counter to the "header data split"
> requirement.
>=20
Mostly not. Currently, the packet metadata consumed by the driver is spread=
 in two different DMAs at two different addresses.
For split q: virtio_net_hdr + used ring
For split q: virtio_net_hdr + desc.

Instead, both to complete in single PCIe DMA and also read in single cache =
line from the cpu while processing it.

> Is there an implicit guard that this only applies for very small payloads=
?
>=20
No.
All packet sizes benefit from it.

> > +   b. Instead of having per packet descriptors which is complex to sca=
le for
> > +      the device, supply the page directly to the device to consume it=
 based
> > +      on packet size
> > +1. The device should be able to write a packet receive completion that
> consists
> > +   of struct virtio_net_hdr (or similar) and a buffer id using a singl=
e DMA
> write
> > +   PCIe TLP.
> > +2. The device should be able to perform DMA writes of multiple packets
> > +   completions in a single DMA transaction up to the PCIe maximum writ=
e
> limit
> > +   in a transaction.
> > +3. The device should be able to zero pad packet write completion to al=
ign it
> to
> > +   64B or CPU cache line size whenever possible.
> > +4. An example of the above DMA completion structure:
> > +
> > +```
> > +/* Constant size receive packet completion */ struct
> > +vnet_rx_completion {
> > +   u16 flags;
> > +   u16 id; /* buffer id */
> > +   u8 gso_type;
> > +   u8 reserved[3];
> > +   le16 gso_hdr_len;
> > +   le16 gso_size;
> > +   le16 csum_start;
> > +   le16 csum_offset;
> > +   u16 reserved2;
> > +   u64 timestamp; /* explained later */
> > +   u8 padding[];
> > +};
> > +```
> > +5. The driver should be able to post constant-size buffer pages on a r=
eceive
> > +   queue which can be consumed by the device for an incoming packet of=
 any
> size
> > +   from 64B to 9K bytes.
> > +6. The device should be able to know the constant buffer size at recei=
ve
> > +   virtqueue level instead of per buffer level.
> > +7. The device should be able to indicate when a full page buffer is co=
nsumed,
> > +   which can be recycled by the driver when the packets from the compl=
eted
> > +   page is fully consumed.
> > +8. The device should be able to consume multiple pages for a receive G=
SO
> stream.
> --
> Modern people tend to dance.

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

