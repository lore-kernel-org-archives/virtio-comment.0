Return-Path: <virtio-comment-return-7740-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D70CDB465
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 20:31:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A491829FC6
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 20:31:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F9E498683C
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 20:31:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7CF1598682C; Mon, 16 Oct 2023 20:31:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6720A98682E
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 Oct 2023 20:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6dnQyZwOPDQMTYHsZQa2HoMrMv304zkDP5A1qTfmcUY1mxYFgFj+8k7nqSRtV+vIqziDLolTJkS/yh37878RaUjiSN3KxZTfEu4MpmYkBEeQJkIdFP0lkdJI2wDuNvEB4MNnCrSrGpLq1cGjRhpVFDtamn0SQMAXvkVAAmSkKLKd1Bwfb8k/5/4ojzjzkRIO3LwNyXazAwuV2KmWMQ4rmBRKjwaINVdnWZR1hTdArz78aUCjQaYUZph2gH2GSImmZE0EZvxGI7q++kl8bz4EosZFYZeyW9T9Vu/stEtKCYIgtlCwupoxoEalK/upD6iWxbNT4gW/OVcIvG3FwCykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWyLY57+oRfIxRMXZxTP1hwcfwF9E/iFomB0pAgXCzE=;
 b=jmqu9zlw/tr+BMEr6cqUSvzTITiQYDKJkts351kBPBP6reJmNYRkG9UjHIVWuuldJp+bc+5GAT/ze/dIR3pDgMO1/jzMPtS2TzteHNprB6Tl2S9zQsAHgkQcfwrU38JOLmr48r2QHVW21bNj868tUKNjLMgvjCRXX2MhZ8JvTuaEs5cXvssTqtCqMLttTJ4keTjY8oJqdcFzslHLS+0IDV1hsP27nHKXRsK54SsSFw0DaUKDKW7INP9npTeLZkze39F+4xNwdaU3Zy6BWAMdRWEfT+4LfSQ/U/rV21nWrDPHCQgAvzwWFweBqIFxDqXefIocE1ryk7rOJLvpNU1mtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>,
        "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>,
        "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>,
        "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>,
        Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH v1 7/7] virtio-net: Add flow filter device and
 driver requirements
Thread-Index: AQHZ+N1ZBGAHEerA4kCCxMphUSLR9rBLiIVAgAEokgCAADxmIA==
Date: Mon, 16 Oct 2023 20:31:11 +0000
Message-ID: 
 <SJ0PR18MB4477D8B32E604D200F083C33C3D7A@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-8-parav@nvidia.com>
 <SJ0PR18MB4477132D1F1D21178F4BC238C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB54812504AD83992BE20C720CDCD7A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: 
 <PH0PR12MB54812504AD83992BE20C720CDCD7A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|CO6PR18MB3860:EE_
x-ms-office365-filtering-correlation-id: 4dc0a2d4-0e19-48e3-2f88-08dbce86d5d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 93ZST5dglVBi4FAfslrjNuumW6T/3pe0wlLUfBrx9xGPuWJhesnJ9o1Ou93UcOFpe6hIJhgcrIkG5Ts87nPXHEHqiRS02tEkEwn3xZjIfqibhwXPl995pBf5DdtWNSOekb9LkpWnkYZKgbSXvUYnRP8zVnf2uu2LCq9fEO6xahx+RkFlw75L+XlNbnFVlUrFMU4Wgy0d0ZxizqG0IqOjAaM2/XFFAsSnIueiCn+akrk8bW4lPwvVnScMiTAEBk3F9F17VbtTV5+61e0L5l1hxFtOoBNuO6sV9Hc/MLKtx1zkRb2Ma4UN2F1mgFpPLy6aQ87fgXjTookJQoWsVHTEPuOBCglJseX/08W2zLZhiGoXtSA69GQAdvfqVJ4e/GizRa9X0sa7zW5Itk9skbwh7o7N8cVn6UlguWU1tcrT7HhQqCWqh7go2NW///6ak/VsxmgvIRpXR2T0ux3v9j6IMUFKGLFS0diE/42s7YtDUCzqYhNvFC6JW8lnUxN14tJJlE0q2c0uudUgSBEvtC3evX7oIczkWoxFyLUni3Lg8rLO0Q9INL0XEoatn6o/EW340d54b3tb+O02cc4rR5FRTrVAlf/1OgpURWP+ylZdk6M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(55016003)(478600001)(76116006)(110136005)(66946007)(66446008)(64756008)(54906003)(71200400001)(66476007)(66556008)(83380400001)(86362001)(38100700002)(316002)(9686003)(7696005)(26005)(53546011)(6506007)(41300700001)(33656002)(5660300002)(122000001)(38070700005)(8936002)(8676002)(2906002)(4326008)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xyzcUz7Qnk/uiujoQGelGJWyxsHfU8hrNzJU/vgJd3Z7LRtbSv07o/pZskO4?=
 =?us-ascii?Q?6R8QM9ENWhDKuVMWP/JkapzP8yaZjM4/AmtlcTMwPsgkSbRvOVcE+vIASBi6?=
 =?us-ascii?Q?uVyCVjx/ZHTuqVED899Cd4slWBv+S83uDBftgU24eGSj0tqnFBnMjPV9vsYi?=
 =?us-ascii?Q?9TTqn6VTNIIf9ul9tari8dOVpnfyrhVthoq69tXHL2qv6a9f9KtAfa7VLks3?=
 =?us-ascii?Q?qkfk9hrdOnlMgc0aYz5R58gN/H93EwmOVibdmRV+HfyOcJRA4sAYhOHMHQkr?=
 =?us-ascii?Q?/RsjeCkNETq4o/W+2fDIa8UrLHvDnArsOJhDxXK869aodiDrdp8Nowex1ZUB?=
 =?us-ascii?Q?2TcRGDUjueXjr2sI5h5w0qqUsQs/5genzyQNeVj51nLMAoNF4ua2e+3pZV/5?=
 =?us-ascii?Q?Befgxw9zsAXhxcrGRQcqp2KQrJN85a1CtGpftPujfuSQUgD5+zM4Tb1PwJYt?=
 =?us-ascii?Q?Yntcodr+Bo8NlHmSasaDxiPf3F2R8wHTpGBdECQ2XPWcV+BJpAIRnbPNL6Ch?=
 =?us-ascii?Q?WFJCzv9V2/PRs/PpQLfkA36y68SMLIxR/whhiNws7I1PsvGVO1auIwV2V9oL?=
 =?us-ascii?Q?WUPbOznIttGXDnCVOHmYAe5aovzA5DiFStydlLqZfrQxWV7Spf5uYZJZMqn7?=
 =?us-ascii?Q?qph08UHxMS3tOqI03K39CKJfpwcSbLlgL5Vl71Ub2gVt0P+HPEQ2cu0p1cCB?=
 =?us-ascii?Q?7doMU5mUCniXIVJicqMzhU4BvP1PpjtEW5VHEFpK8LFegEAsf6PAAyB0BNWi?=
 =?us-ascii?Q?c554S0iyJGvyJ2ROvZIh5kNWY28/EwDlmrVHjv1GhuHU9vAGfqc1BdYdnMvi?=
 =?us-ascii?Q?vAFr//25LAlEMM5m0qzc1C7IwJq8864Z86bszjSRJxhlKh2h18qtypZAPJB7?=
 =?us-ascii?Q?bl8AoQo72+tIqOQ/GG0mbtl8GhS51Jc1TtRmetGyd6wTdrYM/dbDku8eylg1?=
 =?us-ascii?Q?cVTcgA/gOXY+4wm/JGoWdo+8wifN7qbauxrbdxzUlwcdI8xIiSBipJJLRd62?=
 =?us-ascii?Q?KUM3S+AbFpbSWOoU5ovkZPTE/cW8PfWnILqZQT2a+T/CX34zw3LQQrPXxS+i?=
 =?us-ascii?Q?z4gvyMueqRWtv34Ua5q1H1O5RU3TuB+NqSWGAsUj4RMUqnbVjFuOQ6G9AuH6?=
 =?us-ascii?Q?6o6VVmqch9Drt0lswSXQCu81AgIQ4VqrzxAFH70ZKp5kRjpQHQaBqWIzEi4F?=
 =?us-ascii?Q?rk31FiedfI9sd12jvYfGPooQoXF/02sb3OSrsQPumPLDsp7aKXa46T+RS8Ec?=
 =?us-ascii?Q?i/vCue5zAmLO8Cq999J+fB6ZLsAOrLievXGdFMDgNhhSMaHeD6CB5qz6kW7j?=
 =?us-ascii?Q?8JXQTvZXZTjbz4Vet3+66Eg90lmRW1mcfM0QsvpMSr7h7t0Zf7dy5FpjtJ1a?=
 =?us-ascii?Q?oandhjCIXYOzK63MrEe7XBxtLGhGuOZLwgTIXO/0qNpA04G5pqnKSmZdS+gP?=
 =?us-ascii?Q?7iHY7iMFN4MtE71hIEEZw5AYx939kU0DVaiEkY+xapDcI0jctUcFD30vYu1E?=
 =?us-ascii?Q?9yyzclm67v7KYamdCb3HpXapCWFWcjrfmZ3s2DKtvrUewaD+1JQ8vqFIcBVR?=
 =?us-ascii?Q?efXHq81Y2aLhLG//Ei+T4vf5EiSW49ApiuZq5Hvi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc0a2d4-0e19-48e3-2f88-08dbce86d5d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 20:31:11.0988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L4dFUXuMPwKB/XLnGuyK00qIFW9Mq4+as9zP2TJVocOzaXVyy+8b68VKhEIaqCg+R70JtQwjXiQuPXqI1GHf0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3860
X-Proofpoint-GUID: i9JQrL35-MeMeZs1xE8Taz8aNQa5NLyX
X-Proofpoint-ORIG-GUID: 0agtNj0qT1xzzP9VAwxxpFaq_-iWGf0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_10,2023-10-12_01,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [PATCH v1 7/7] virtio-net: Add flow filter device and
 driver requirements



> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Monday, October 16, 2023 9:54 AM
> To: Satananda Burla <sburla@marvell.com>; virtio-comment@lists.oasis-
> open.org; mst@redhat.com; cohuck@redhat.com
> Cc: Shahaf Shuler <shahafs@nvidia.com>; si-wei.liu@oracle.com;
> xuanzhuo@linux.alibaba.com; Heng Qi <hengqi@linux.alibaba.com>
> Subject: RE: [EXT] [PATCH v1 7/7] virtio-net: Add flow filter device and
> driver requirements
>=20
>=20
>=20
> > From: Satananda Burla <sburla@marvell.com>
> > Sent: Monday, October 16, 2023 5:10 AM
> >
> > Hi Parav
> >
> > > +When the device matches the flow filter for the packet and if no
> > > +match
> > > entry is found
> > > +for the packet, the receive packet processing continues to next
> > > +level,
> > > i.e. to apply
> > > +configuration done using VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
> > Did you mean to say that the device has flow filters configured but no
> match is
> > found for a packet? I think the following line is confusing "When the
> device
> > matches the flow filter for the packet and if no match entry is found"
>=20
> Yes. It is confusing.
> How about?
> When the device perform flow filter match operations and operation result
> did not have any match, the receive packet ...
Sounds better.

Regards
Satananda


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

