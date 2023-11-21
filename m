Return-Path: <virtio-comment-return-8496-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FC9C61D92
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 12:54:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 72F002B062
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 12:54:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5287798688E
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 12:54:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 31715986879; Tue, 21 Nov 2023 12:54:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 20C7A98687C
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 12:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEHNK1TbrsbIdcNwvzjx+Kuaa0rtbzvUFRo0mH/IJEFlrdAdjahcizvb/zrmvFGf7nWVH7/cBDhwG6v47kwmtQMXYf7ul7o87Sekt/4K7uH059gE4vi1fQS41BJ7WWNHRksRVwWGfEDPPJJ4Ivelih0N/iDAUl1lBHGt2JhqKFIC7HFq4PyOzWbYu7kioCTE7AH7Igk9H3ip+4G6F6DEFfFn074IetJa+Qrm4E0kEERrsPuM89mjbp65TrwsE1AZSxIkCbTzsK08e0PsykTN7S6XlDkLbTRpZAnZ5Xy4cz/5UD58Dgv9kFV5Hr5HenGoEGeNBCjIqC17vXdMhPUtSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cf3cJHwwF7aPpiXNlFreirvmnap4fwl4xh8x1nGYaac=;
 b=AyEiC2zGiG5I3IOnnJ61pjCJ7NE9SkjvjzLkUqtFpZgdbfejiAOgDu4dk793UGcRWWfn+NKFfiTZph+P49C/kP5ZST6GtpVbO0D/pTSsvLM+jW0Kfvvq4QxJwoUUKS0x6WhOSxSR6BC3/Ej/fOgPiC22dcez6+nNaBnExx1FIsQgKAzFt1jnIfphUBRURkGw5sMN7tMlxRFwBBWB1fzI3DcTsZ738bOKWu5o2FS4C0CzbnVxOLKTp4igtvh84y8QEwxRUzsd41/nUqzozQv0gnBaRtHuGNU1zF9wnXgw7Q5hxXYWz1qtI0BTMdB+mA5tGi8NsMSK1Mh765cCjYiZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Thread-Topic: [PATCH v6 0/5] virtio-net: Support flow filter for receive
 packets
Thread-Index: AQHaE9LvQ+6uKAfIN0Kopom3Mm7xhLCC0snAgAH5AhA=
Date: Tue, 21 Nov 2023 12:54:34 +0000
Message-ID:
 <PH0PR12MB54816858E31C03D337A6126ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <PH0PR12MB54817956B291856378B4B013DCB4A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB54817956B291856378B4B013DCB4A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4123:EE_
x-ms-office365-filtering-correlation-id: 8713dff3-dc6a-4e2f-9eea-08dbea9102f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6vb54lVT0gjh7xjVmQ8ogPDmmL9+yKrcgc/mMUtSVw+UsbdX30ZZ8jMq+3GQiZnnpiduCPygjj3meu35JsIu76GxciBS0qJCZDTAY7zrnaCGGEsJPsP5AjtRCTIybjeEzuRC8h517Jptp1KWkla9+RpcmZaWn+m9CQGxGI2ImzKivHxRE6LI5rxH+erdVkCck/xTX0F4mkBDB1GH/zVLqivOB3PLHDxJWReamO/wFeoy0oD7H/8ak9W4jAj3TkuoIvWNILsXItRZDm7KuICSNf5ErzPFYNvDwofAVXnuMfFaaO1xXkvalNX41IC2niePF0wf0t2IZ33vigJzI3A3FFF7Xsg++gBH40z2liSzmLuimdYgHwPQTSCf14pPdT/aMOIyH2P4FVMUw3U28CQzED7hWvVieOSXgWdI81s+8TsM1uQxW2hbszhgN87fnqjutGySSAziagGHAQkeH7p4tRJMMaKsbarKIjHAeFaW7irXpTjBvECYWlZr2DTp3didi1n427YexeXYETJahdD+Olc6PMPnL/meFuth7bMw8CP7cNKbS3qUs/d/3apl4BkrllrvABynRMUbX4IG78yOqXnPCsrgaTYgXr1whWe5Nt9Zn9/bk44eSUkBYYq8EzJt6y7xrttoXqmCXS6Lhyhef8poGLzMecQnGLwfGrGysYpIF7McS2NHB6/HBUNX6AUys/w+k1n7XlJ1ac5ZtGgHeQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(346002)(136003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(9686003)(38100700002)(76116006)(66556008)(54906003)(66946007)(66476007)(64756008)(66446008)(8676002)(110136005)(4326008)(316002)(8936002)(966005)(53546011)(83380400001)(7696005)(6506007)(122000001)(55016003)(71200400001)(478600001)(5660300002)(33656002)(41300700001)(66899024)(86362001)(2906002)(52536014)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LYeqM8xYfJxy2lP210f6ynF513ExdWIndSiGLSFCJrVTxwAG/sU05AnDUHNK?=
 =?us-ascii?Q?HB0RI6mPKfHFxHJ9ijRos6+BN30N5jaQXPnl/BbndinKiPFl67hRmUcPVHMt?=
 =?us-ascii?Q?V4EAeRBxC3ZcPJjxcGG4KEa3GrwoUbgIUshkBRFmORajq9op/xojUyMZ5jvO?=
 =?us-ascii?Q?3cpqvqKUt3bZ6te1p6ghsbFwieT1tiGsCP6m+YDXf3R8IuQFkzvsZZ+7Vy7F?=
 =?us-ascii?Q?bpqgfBSM/IN63qjXz4fTHCP/u2qygNb0noYbXBFf6SH5dM1q09MW76dAV9sS?=
 =?us-ascii?Q?gaf/+LF7lTjKrxbfvT7OkUfJ2hxAkXg+7loQeZ556OsOum9ywz76UuQ2Oczp?=
 =?us-ascii?Q?fNycA8pYOdlpkNG1Prr5duclkleV+8g2IugDUFPfRyoEKcZvgjqCO4MZQPk4?=
 =?us-ascii?Q?FXeQRpFuEhYd0Ge2yFKthMA9brAFOmGXajQF66K8ANFji62AlE/btmMhfZs2?=
 =?us-ascii?Q?FmOceVNuSkBoW78B9Qxa21auzFIIXwMOFW+i6ZunZ093sxnOC3ZcN0Xv6qSr?=
 =?us-ascii?Q?UCnrRZo4xuz6df/hjx5tnvquyV/+dlFt3isXzIMwu2hKysuPPlcsD6hac5ju?=
 =?us-ascii?Q?kA+EQZNudm8Oraj6nvUlL9iI4Vf3j5x4N2wBnkQrJv8A2aaBERw6qvCvBXAy?=
 =?us-ascii?Q?i0wzYv2olzFbnJJ/Lwvn3+kW9El0xumptdN8z8THYJIfwM/ys64bP2Gdj3e6?=
 =?us-ascii?Q?cYvvRcN42QRnIhIU+A8AlvtM/UDpImX2ciTLld5BfbbjCpxJaCGn/uTh1OI2?=
 =?us-ascii?Q?wnSrydBzv5MeGD9E4CvQ83epNW/KJaqxsQ6N9bx+mOwd5o9wrJKyKg0iRC9Q?=
 =?us-ascii?Q?uhzKMxGk/DeqIATxqzLiR15p9KXfk5bhzMMYSrDqpOy7n/27Lbsfl/YRNFOQ?=
 =?us-ascii?Q?RIFggB8fCieA2fldSNCk6AcVfPx+nr2p79/6y4U2AvxRBNyUwLwi/+dZ7WLT?=
 =?us-ascii?Q?/CRo+OMnampnu0sQ18/WSiVDxJNu36uKlhlGutDRS3QYnC1TOo8OlzZ+A8b+?=
 =?us-ascii?Q?jdy0XTfqNEqxtyprdCOavpWYqOSBSJcjCBB7aNQaU3x3mfSbhFvbXhmLRo1R?=
 =?us-ascii?Q?HJetrPt/etmAIaUs4I9ehXJzJXINqQ3ggDYAThT71JNciCprxAJRv1cJuDMa?=
 =?us-ascii?Q?kc02m2P5REN3rUP6JSIaHe27Zk0sY3TCFEsoxBnvujRsUvF+41c+WOad/K7Z?=
 =?us-ascii?Q?qSkyw3+qupeaLjuZ+dYvUiozgjcvxJB9mp2oYn/+W2rJsSiLeAwVcnoxvKF5?=
 =?us-ascii?Q?aDyaVElEYGgQLGL3Eh7TLfXvg3i1Ji83uzPvMt3R7d5NMqkweOBcqSsDLD6/?=
 =?us-ascii?Q?oksnu5TcTxGZUIyUzjQvtwXA3uhDcGwF/AegX0hTQkEZHNtvr4Hik+yMPjlW?=
 =?us-ascii?Q?L6yKqWrpL/cN1aZpTE0e4wj0C9oZx6iumYC96UqJcrGRXl/a2y47DacpPzOl?=
 =?us-ascii?Q?A6qY5rq0fyx2rmN1TrZYiOpqqOPOQETy0omMaoC0b7EtOv5cjpyaqZQ1tHlO?=
 =?us-ascii?Q?ygp2uWKxb0ywdhq1VhuTSe+J7nPZDRUPXUqTG19QT2cAW8ikT1bXBXZX27yi?=
 =?us-ascii?Q?857P7c2/7xxsyz25E0c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8713dff3-dc6a-4e2f-9eea-08dbea9102f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 12:54:34.3386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SmnVjQ5Te30RpIQPvbw9IiEf4EpucizyqG6troL9M9oNgxN/1eYYZLWzhsnn/Bn2a2cojCKbNf+0LLsde5zo7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4123
Subject: [virtio-comment] RE: [PATCH v6 0/5] virtio-net: Support flow filter for receive
 packets

Hi Cornelia, Michael,


> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Parav Pandit
> Sent: Monday, November 20, 2023 12:18 PM
> To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> cohuck@redhat.com
>=20
> Hi Cornelia, Michael,
>=20
>=20
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Friday, November 10, 2023 6:09 PM
> > To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> > cohuck@redhat.com
> >
> > Summary:
> > =3D=3D=3D=3D=3D=3D=3D=3D
> > This series improves virtio net receive packet steering to
> > forward/steer packets to specific RQ.
> >
> > This basic functionality will enable Linux ethtool steering,
> > Accelerated receive flow steering (ARFS) as starting point, and more us=
e
> cases in future.
> >
> > Problem statement:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Currently packet allow/drop interface has few limitations.
> >
> > 1. Driver cannot add or delete an individual entry for mac and vlan.
> > 2. Driver cannot select mac+vlan combination for which
> >     to allow/drop packet.
> > 3. Driver cannot not set other commonly used packet match fields
> >     such as IP header fields, TCP, UDP, SCP header fields.
> > 4. Driver cannot steer specific packets based on the match
> >    fields to specific receiveq.
> > 5. Driver do not have multiple or dedicated virtqueues to
> >     perform flow filter requests in accelerated manner in
> >     the device.
> >
> > Solution:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Flow filter as a generic framework to overcome above limitations.
> >
> > Overview:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > A flow filter defines the flow based on one or more match fields of
> > the packet, defines an action like drop/forward to RQ.
> >
> > The flow filters are organized in flow filter groups so that their
> > processing can be ordered when multiple applications wants to use it.
> >
> > Flow filters requests can be transported via control vq or dedicated
> > flow filter virtqueue so that it does not get intermixed with other slo=
w
> operations of cvq.
> >
> > Flow filter requirements addressed by this series is worked by virtio
> > community at [1].
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> >
>=20
> Now that this has been mature phase and on list for several weeks, I upda=
ted
> the github to point to v6.
>=20
> Can you please start the voting process?
>

Ping. This is overdue.

Can you please start the voting process?
=20
>=20
> > It uses updated control vq command format from [2].
> >
> > [1] https://lists.oasis-open.org/archives/virtio-
> > comment/202308/msg00263.html
> > [2] https://lists.oasis-open.org/archives/virtio-
> > comment/202310/msg00047.html
> >
> > Patch summary:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > patch-1 adds theory of operation description for flow filter
> > patch-2 adds device capabilities cvq commands
> > patch-3 adds group add/delete commands
> > patch-4 adds flow filter match key, action and requests to transport
> > via vq
> > patch-5 adds device and driver requirements
> >
> > Please review.
> >
> > Changelog:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > v5->v6:
> > - pick next unique bit 65 as to avoid conflict with rss context
> > feature
> > - fixed missing conformance links
> > - removed white spaces at end of line
> > v3->v5:
> > - removed left over dependencies of flow filter virtqueues
> > - removed partial sentence
> > v2->v3:
> > - removed dependency on dynamic queue infrastucture which is
> >   not yet ready
> > v1->v2:
> > - addressed comments from Satananda
> > - squashed with match fields definition patch of v1
> > - added length to the flexible array definition struct to benefit
> >   from future runtime length bound checkers listed in
> >   https://people.kernel.org/kees/bounded-flexible-arrays-in-c
> > - renamed value to key
> > - addressed comments from Satananda
> > - merged destination and action to one struct
> > - added vlan type match field
> > - kept space for types between l2, l3, l4 header match types
> > - renamed mask to mask_supported with shorter width
> > - made more fields reserved for future
> > - addressed comments from Heng
> > - grammar correction
> > - added field to indicate supported number of actions per flow
> >   filter match entry
> > - added missing documentation for max_flow_priorities_per_group
> > - fixed comments from Heng
> > - grammar corrections
> > - spelling corrections
> > - fixed spelling from initializaton to initialization
> > - added more requirements for multiple actions
> >
> > v0->v1:
> > - addressed comments from Satananda
> > - added device requirement to return non zero value in fields_bmap
> > - added device requirement to not repeat filter type in response
> > - added driver requirement to order filter match field as it
> >   appears in the packet
> > - added device requirement to fail group delete command on existing
> >   flow entries
> > - added mask field in the type to indicate supported mask by device
> >   and also in later patch to use it to indicate mask on adding
> >   flow filter. As a result removed the mask_supported capability
> >   field
> >
> > Parav Pandit (5):
> >   virtio-net: Add theory of operation for flow filter
> >   virtio-net: Add flow filter capabilities read commands
> >   virtio-net: Add flow filter group life cycle commands
> >   virtio-net: Add flow filter match entry, action and requests
> >   virtio-net: Add flow filter device and driver requirements
> >
> >  device-types/net/description.tex        | 630 ++++++++++++++++++++++++
> >  device-types/net/device-conformance.tex |   1 +
> >  device-types/net/driver-conformance.tex |   1 +
> >  3 files changed, 632 insertions(+)
> >
> > --
> > 2.34.1
>=20
>=20
> This publicly archived list offers a means to provide input to theOASIS V=
irtual
> I/O Device (VIRTIO) TC.In order to verify user consent to the Feedback
> License terms andto minimize spam in the list archive, subscription is
> requiredbefore posting.Subscribe: virtio-comment-subscribe@lists.oasis-
> open.orgUnsubscribe: virtio-comment-unsubscribe@lists.oasis-open.orgList
> help: virtio-comment-help@lists.oasis-open.orgList archive:
> https://lists.oasis-open.org/archives/virtio-comment/Feedback License:
> https://www.oasis-open.org/who/ipr/feedback_license.pdfList Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-listsCommittee:
> https://www.oasis-open.org/committees/virtio/Join OASIS:
> https://www.oasis-open.org/join/


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

