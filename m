Return-Path: <virtio-comment-return-6942-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A9CC001DF
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 04:33:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0E7DE78DA3
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 04:33:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0814986602
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 04:33:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D8A5B983EB5; Wed,  2 Aug 2023 04:33:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C00F89865EC;
	Wed,  2 Aug 2023 04:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBNvtDgfckzNEVIyjeJjtOOFBuXI3239UFy27dgiWhaRdPssb1GxQ0FLVWlk1vcizn9t2Jew8V17xVLxvXwWS6oNMkjP2URS5wHEqtcZKZ55bSOo+7UhMOr/r7Z8xCe9P/HIK9w8Zmj4m5aC3GHQsyfh7sEE7PFDIKiPw5Vg29SUez5LJNr/JBbsmecdkg9sx1owhiSFaUVD/PqrDfVYR2J/3icvwriNxeyrT67o61wQd9FE7yEFO1+t0FRJKgsA/o0hOVsNzoexMB5CRAJzGrcprQ48hw+mWvczsqEBTBXcIkuoMdDC3JIqpqyQmq9A8cZQxsR6V7VUu5czbC2Wgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2ii4nJsnv54t1gOl13TmwpHjKrNLh0IlrjRLCMQ3Go=;
 b=bAGlt4+1BnpJ4C8QtXgFxj6/Ja2P6FSzM1aLZ9xMTtMb+rn1OEGGpaRmPGUnVKutBLjlZDGin8xJcxa7EMstoD46fHlD9qxymzBB+V9VEb88hKFJ1gQF0zy6pOFrLdMTlBM/onsuZjnaRfL9hxxCtB4UqQSQ2aMGJ1ajf6al+2Dz6LEsLZgFDQde4PfYtMjLMHScFWl3pasxM4dGQAgA4DbBeH1kXhMr4PA35JbLKf+tvtLFNMSHpoGtNrgHAhdmbRJHdFIoRDPPHq34gxNuwhoe6PRQmvci3o9XYT7JDYLfY7cddAWNEjZDn8aF7aBFKdqadTuiC4Pd5YfthEIdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, Zhu Lingshan
	<lingshan.zhu@intel.com>
Thread-Topic: proposal: use admin command (and aq) of the device to query
 config space
Thread-Index: AdnERrUyzvIBkM4LRwukraLndwiuSgAseh0AAAASC2A=
Date: Wed, 2 Aug 2023 04:33:08 +0000
Message-ID:
 <PH0PR12MB54815A0B1E5CECB5519CE42EDC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802000955-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230802000955-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BN9PR12MB5276:EE_
x-ms-office365-filtering-correlation-id: 9198a7d7-98a1-436a-637e-08db931192ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ttYLla1GF15hgVkiKCjJIf6R0OYX3tOWrQqu7tQEwKtfL94PymQp33qKV/bP9LucUPHCUUzIq27lhw4Mab2Gx99UltoaKq1Yv702VQ+lZVLQQVrUkGx57giHsZ2XOwJKxzlO8TYIMUxsGrBx1Ee/snPMkzVX3WkXjbNyM0L3xjKS01DWQFVd+/vjii+iBLA7nI5gA/tMnIIepeMtKlyP4b40jV53lItDQ+NxF5Q97vaSd0Q6nhF2tADK78iWRICvPrS7IXWfXQdAn2qdo3qjN67VAYUt5BLKw219EpQQ4nG2u/TSTDddBE0mwNEI/rxft3pRr3ltcDEy0aeemuYPWMo52KGChJ0O9BYBv2VmSLL308rDg6Kl9GvPBGhv/tZtf+izb831X3ArLzxG0yub2QsvnOhtEKXATXybAKA3ITvetYeiw9rPRbjIg7aXNedJi7c4MdY+6OjbIjy8PpNOKCiYxkLfmSipWucTaycw+m5X56ugBplQh0zL/QRQbk+OIbBzGevl4207ZZ4UsLLvqL7LwUjxI/jc4vymUiXqeAyvPfYdHg6o54irUJqCrHsKD31LQRqF+lJ/W2IcvgCLKfc/xVKnnfwqzC9gRi2bnpYincY8vM3vJL/7x8nPOzxe
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(55016003)(186003)(9686003)(316002)(86362001)(478600001)(122000001)(54906003)(38100700002)(76116006)(71200400001)(66946007)(66556008)(66476007)(66446008)(33656002)(64756008)(7696005)(6916009)(4326008)(6506007)(41300700001)(52536014)(8676002)(5660300002)(8936002)(2906002)(38070700005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wnppqq698kuB4rq+HDo0To5ASgKrccihTlY4kckOP/XtPY1p6R/j0K/hdAw/?=
 =?us-ascii?Q?pi+ta29Uq0pYtAZjrSxcnbEpHmASYPXC/KxT0GbNGwWhpZTJ7cwI5+N15T+D?=
 =?us-ascii?Q?+GCct9NrGNt2kLtyKzIcFcX6qffyygQOBf7dEagoW1lv0ZncdOX1Y6PO3BkY?=
 =?us-ascii?Q?WeOwzhY5xbrPSk2wnMBL/kfzMgNGpmkki6xSjtNlEcdAqWxx/uyREvGmvIad?=
 =?us-ascii?Q?chixYXFPA6F5bRYmC1TcFuSMrmXdv5iSksXxjKJCGcbPMGMTuVQT4JfuILEA?=
 =?us-ascii?Q?LxrTRr044XSVBULYNKzplpGOdpPnMJgbzjdKke0tdLePP4Axozmjgs4Qxk/V?=
 =?us-ascii?Q?abBQlJzw66/699uxNnNdIDzBI6ZP9auDyLu+UGVUT8kNn9jq4AWKtAoxY3sz?=
 =?us-ascii?Q?snJeHeJmC1iIIUlTv7dO5gp98IYiMe8CYqpC7e6mD1QtrVdzWjRY+DlEFbbg?=
 =?us-ascii?Q?8e3SXxXe2Zr2f233oGoV3yxWqhqjH1u4pN2hpN7Oyh4SB2PPTuIlar+eWJ3E?=
 =?us-ascii?Q?DCLyspSSMDShRAqU3df83qYodfvM1L6UpxYlRXa/h4YAwiIaZlYDQ+Rg2f/B?=
 =?us-ascii?Q?+Ykm9GwHHSJp9ipeSOJePcVhpmMPhtWruOv6iJnHaovgbkXB+vIX2YfoOoa1?=
 =?us-ascii?Q?aqVVdWleF/K4/SqnG29jGvMKgJU/i7Xz0tTMFF2ueCgWnCb7gxCV0gl0W4il?=
 =?us-ascii?Q?EmurZY9s9LIvvEHrm3lmbu9kLlgh978LOaKKNUK/xpKnWh/ZsKLGsOui2Z1c?=
 =?us-ascii?Q?+Ki2zfLg/RVNtv1w/T03CRPIRxFU27M+skEe3+uXeXbAftJjzpmnEiMOiUB0?=
 =?us-ascii?Q?/nyLOBd/i5hyyAleL0vGlXqlEk7aFU9I5Hr+GcdE1BTfHF18NHO7BiMZzrIJ?=
 =?us-ascii?Q?6galhTRePV7Btk7ymGD6fIim56hJy2OVlcV9tsExTBiFiOoZRj8mNB8HVJkY?=
 =?us-ascii?Q?7/twDdIcSjTMCljwbrQJXLplM/RSMLmUMDuhswN20BKYwILRVel1fzzbL+Mg?=
 =?us-ascii?Q?dWHEed5SNfsvOlVpdRqbuRuHxYW8lIxsnO3Ujv961UK7PUN0v2uIwptVjSkI?=
 =?us-ascii?Q?H5TA9uC/j7/TS2hiC2l+XLygMEw0TQWDhm4ghKJXLWUo2qGWbAEorkXriRrD?=
 =?us-ascii?Q?BAe57RBqJqRWmcxwwUxhBN5Fidu9GNzbKPrUl+my9Fr8Fq1KnABaEzFkSWTC?=
 =?us-ascii?Q?/FTysiB+0jj5XbHoWVK96NePEoZq80cJcOXVjiOSRHbNGTf2pnSb1EtJ/NBh?=
 =?us-ascii?Q?1OXaff84hQb4X1p3lGLp9z4BS4iXptKGzSBLt654zfEWjCzJiWDNNcTuSODb?=
 =?us-ascii?Q?lXOofOVC5iAOR2yno+EF05U9WYNuu0M3A25QI4lS1KKQs1MmBDTZuODZFFWB?=
 =?us-ascii?Q?LviwB+ceZhotsDieep2MNKlz3YCiNYCMftdPIN+mZ4C8+rA0lJp8ZCfV4/rH?=
 =?us-ascii?Q?Nq3ML8WR3YKUi8GvidztBfTMhPqAiZ/KDfZ1gyBbvZMxF1IcPUtVxl6NImW6?=
 =?us-ascii?Q?UmNop9dZfCBcO+yVZ8qGjftY5IwxlHYn4Q2QGPVSL215US1RJdrzgkuEkopt?=
 =?us-ascii?Q?17ardnHV73+VnnVH2jWqTF6cX7DQf1/3c3qxJd8ShfvAJ/CI1BjYSpL0pX1H?=
 =?us-ascii?Q?eyR6F7L3bsnuW8tKz3uw0dcO55xOsHrIauAm/Wt/m2nk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9198a7d7-98a1-436a-637e-08db931192ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 04:33:08.9385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Es5m4EAK1w4qIB1sspnTKs6y2dDIVaUGQptlmj8nxg+uZz5rPXToAhPbj6b9AzBxNNKlnuHwy4rV0s91JDoHlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5276
Subject: [virtio-comment] RE: proposal: use admin command (and aq) of the device to query
 config space

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, August 2, 2023 9:50 AM
>=20
> On Tue, Aug 01, 2023 at 07:09:14AM +0000, Parav Pandit wrote:
> > One line proposal:
> > Let's use new admin command and admin q for all device types to query
> device config space for new fields. (always).
> >
> > Details below.
> >
> > Query of device capabilities and configuration using DMA interface.
> > Need:
> > Currently device configuration space is exposed as read only registers.=
 It is
> growing rapidly.
> > Some devices may be even multi-functionality device in coming future su=
ch as
> net + clock + rdma device.
> > For a PCI transport implementing such ever-growing capabilities,
> configuration is burdensome as plain registers.
> > Hence, it is required for the driver to query capabilities and configur=
ation
> using a DMA interface.
> >
> > Interface requirements:
> > 1. Maintain backward compatibility for existing defined configuration f=
ields to
> stay as registers.
>=20
> This is both too specific and too vague.  I think you mean "device should=
 be able
> to optionally support both config access over DMA and support existing
> transitional and non-transitional virtio pci drivers".
>
Not really.
New fields always over DMA,=20
for example bitmap for virtio-net counters must be via dma interface and up=
to hash report via register access.

> > 2. Any new field added must be accessed via DMA interface, regardless o=
f
> device implementation (hw/sw etc).
> > Results in single driver code regardless of device implementation.
> > 3. A device must be able to choose, starting from which field driver
> > must query such configuration via DMA interface. This field offset must=
 be
> greater than currently defined configuration field.
>=20
> 2 and 3 look like implementation more than like a requirement.
> Try to think what your actual requirement is.
>
It is the actual requirement to not have them as register regardless of imp=
lementation.

=20
> > 4. Any driver to device query operation must not be mandated to be
> > mediated by the owner device for PCI VFs or SIOV or SF devices. Driver
> > must be able to communicate query capabilities and configuration
> > fields directly to the device regardless of device type being PCI PF, V=
F, SF/SIOV
> device uniformly.
>=20
> I don't really know what does it mean to communicate directly with SIOV
> device.
SIOV is not any special beast. It has its own VQ and registers like VFs etc=
.
Communicate directly means, any mediated PF driver is not involved in commu=
nication.
PF delegate some resource as passthrough to the SIOV device and PF role end=
s there.
PF driver does not get involved in per command, per access transport.

> neither do I know query is and what capabilities are.
>
Capabilities =3D roughly config space fields.
The reason I split it because dumping everything in a single config space s=
tructure is not good as fields gets sparced.
For example, Xuan adding some 64 bits for counter and tomorrow we may need =
more bits.
And Heng and I will add steering bits after that.
When half year later more counter bits needed, it will be located at some d=
ifferent place.

If one reserved, it may be still not enough, if reserved too much its unwan=
ted wastage.
So capabilities is basically logically clubbed structure per functionality =
that one can query independently of other.

Like,
struct steering_capability {

};

struct counters_bitmap {

};

 > > 5. When having multi-functionality device in future, it is desired to
> > not always query all the configuration but may be able to query per-
> functionality configurations.
> > For example, query only steering capabilities, query only rdma capabili=
ties or
> query only clock capabilities.
>=20
> I don't know what query is and what capabilities are. Do you mean "access=
 part
> of config space"?
>
Yes, I explained above.
=20
>=20
> > 6. The driver should be able to query config/capabilities without
> > polling for the DMA completion, in other words, the driver should be
> > able to get notification from the device when DMA command completes.
> > 7. The driver should be able to utilize existing interrupt vector
> > and/or virtqueue for query and set operation without demanding
> > additional interrupt vector whenever possible.
>=20
> additional over what? existing where?
>=20
Additional over existing usage.

> >
> > There are multiple options for DMA interface.
> > Some of these options are listed below that we would like to consider f=
ulfilling
> above requirements.
>=20
>=20
> Cc: Zhu Lingshan <lingshan.zhu@intel.com>
>=20
> Zhu Lingshan are you still interested in a transport for SIOV (what was c=
alled
> transport vq)? Clearly SIOV needs this as part of the transport.

Its not related to SIOV.
This proposal works for PF, VF, SIOV without any difference.
And possibly for non PCI transport too when done using VQ.

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

