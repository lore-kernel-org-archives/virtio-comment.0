Return-Path: <virtio-comment-return-5963-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BA9C77B7A
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 00:54:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CD9C929FC9
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 00:53:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AF63B9866FD
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 00:53:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9F4D09860A7; Thu, 18 May 2023 00:53:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 832439866F6;
	Thu, 18 May 2023 00:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSBPApojdI6V8LILbaAgdSwpodLDrt0CbkhYghde81PN7LfnTLDX2A1TVKS6w+Rf4K6io/vul3Ir6RnblHc7w0vuE0lhZZUXyAXdApPv3QBf7O/5CuSWs8kCtaDGJ0WnwIetluQo0uG2JZlLZKlc8cX2EGqhrbT1qvHOYUIR7w+TVjy8tLBqXho9VAGwh3TmSaVAZqYAtEbsqjR6OTmgky6VtRvj9KIofBg4Dd8q2IMOeMFX73AalagQdPgSKG3Pyz+C6N8J05i7NWnNoOPHunyUc4xIyJyV0A2Bs2V52r6BMC9S0ywdogfiXeWt/r/sdaUL6kDNt+BoL3HzEwFVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rHLsd2Jd3lYowbh37j0XBmD31UPe1mzYbbbsjOSqmU=;
 b=PYWxF7mEQ6Vo2HSowTyFLIJkQqi62g9tgXDJIdrhP8IhkNbM4tNXJKhXUwooNtqC/ZSl3Z4K99Ped27XzvZQDED9NjKASFdpkzrP0l5kBblLqKc7vLQMDFbVTlW3OnYlgN/Y2IZVf+vYbXrPHnxMhugNsPT1TXD4vc7JNRa/5RfZI3zz+mN+7AB5GieaceLQYQ+5MbPBN0ZdWB1pL/9S37ea6WYicHougdQ83/Cm5v0rM9CQ0ACXYSDtMjil1guyBD3j6GIyPDQWAnf3Pbm+HlnATkWF7peHdqrLila6Mtq19sM+RLeRjYDXcuvIHx5jS3VTBm3YH95TGm2z5Kofog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: virtio networking collaboration meeting: call for agenda
Thread-Index: AdmJCcjCjRUFdJrUSz6FqEiskKvSlQ==
Date: Thu, 18 May 2023 00:53:56 +0000
Message-ID:
 <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB8237:EE_
x-ms-office365-filtering-correlation-id: 704d9b81-dab7-489b-6f26-08db573a5c21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0uGFHxS4y8nBsTUOp2Owq49RnB4NxXlDDjXbtb1gsjVKILLv2gEztIyHNNbvELbN4FMa2cdMBH0hB5SwwynQ1aacguxQ5bf0MJ1AbCYcyf+ckt/1MimzQlRwkzBH8G/iiVi2LbGGTLYfh+mlI12UcSBp5ABtepo5kJhtmc1NiBcFNIBOGlyFtm6bkRkMr1QPlK1tDkUWV1ut4dA62FED+xy2kcroUjMLZAoS7Vhv2e6NAHhhvcE0ZO3wUX3UpCgWkSVU01Y0MDxHs8emSXtNRTW6PlMWXxl1QI85YoCTV47mvavr6+rUiw26LQZfZQfrq7AW8U/l7ph3Z/WrGRPbr7WrpGZn7XN3SZ7DrVHn4PikGOooAqdhbHdqp8QskHKyg7Gx5gtOs3qemUDnGbNryZjxePrz4KL1EiQhK5sGY1zQgGvFR03DGEJVCoOjWYoVK0oq37HOY9TEyVfpfbWS7MlIpA4uB8Lp0M4tb/x3Jug20l0gaLWy85dVbXSwudhSfaq8uMzvyuS83IbR0AOFxJlAbVXcFhDpJBkw/0rxQ5lCSagG+IBwhAWygl/W7wmYlf+th5R3OyqfYOI9W5DQRVWmHoxqAR0cMYXlvUMLNnzDaQFFudc81uTHoZRnGrnu
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199021)(86362001)(7696005)(33656002)(41300700001)(6916009)(122000001)(5660300002)(52536014)(8676002)(316002)(38070700005)(66476007)(4326008)(38100700002)(66556008)(55016003)(76116006)(66446008)(2906002)(64756008)(66946007)(450100002)(186003)(6506007)(9686003)(8936002)(26005)(71200400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lS8cMG5s1hFJga9v8uRDVttX+5CsQrB62kQbUXy4JDjRCWNlPTOW1VvCMikN?=
 =?us-ascii?Q?9I89AeK9OPUjnc86efILj7hF+YNIqJMmpRffG9n3gK3+Ymw+lRss7jJF7pWh?=
 =?us-ascii?Q?Bca03hFAnYxA611sU5gfKg/Ena3kVP+GDAdw2e/v4PZd302ICHUGMeh29pqh?=
 =?us-ascii?Q?fgkmDCbddIHG9Ch9URNL2sHItWdtIkVZiHi7Y2YByo5mXWZrda7U2yotkIwP?=
 =?us-ascii?Q?pmDVs2+s2o4TQbhDCUtVdT+z/CDJgmeP57B3oziHUsDHN12eIPevUTxGRAbj?=
 =?us-ascii?Q?jTKFv0V5v2lDPYszLFBYUMPTmikMK1IXLFLrswDoGOGLBqxrVgJxhQApRX4g?=
 =?us-ascii?Q?a2+/s/NMA21Wedcx2TntFCA1liPAxO2119kwoGrX4R7095Zq8+tTEzkVgqNA?=
 =?us-ascii?Q?y5vwhxrJvqrz9EJfAcZLbjg+ArmQuGxOPxgZNMPGXit5RrfDZvZAHCm6Gmzt?=
 =?us-ascii?Q?MWoRzkS/DSQ01eKmwLDhnTQjMQsL9YLovKF864k3Zi0QLPMabpYllZLbJHUb?=
 =?us-ascii?Q?it770E4TqNL7jlO/UNGu2rI0KbUSNQPmgNB1ldW64tdFu/0Zi5sUR4VTorRN?=
 =?us-ascii?Q?sWdTSetAJq7AxW6X5qEKGuMnqP8OK0RGSzYNylOUJJrLfT+YC63Sp2Cd3d0q?=
 =?us-ascii?Q?Yrx4HxMzzOgm6WVTCAUQDe0HLPjJbejIZ/nlsj7SYdTXPGzcIsZaUfNT06YL?=
 =?us-ascii?Q?T2UcYcWcN1uWs3dSbLESx0uosxjzKDm+hSeXHrSPkWzrCoVTvpc4Z/wE1xxp?=
 =?us-ascii?Q?y+WOJyKiFzgZQ6/P73pFpH3MQNjQIpKDNx4RMHtegZ3ex4F77AEd9mKxHPFE?=
 =?us-ascii?Q?3+bd4IeshHQw92HXP7Pwdvty06tWM6ngy2C23verboKpLFUCgpITlUnTrKtE?=
 =?us-ascii?Q?NsTRshj9hraCR62udXn3uDTXcO6eIOEeuSkm+u9AWR3nWsuBkngC+BEy9sXZ?=
 =?us-ascii?Q?bxP591Z49eJ730NVEp63KTiIpluAEzMLLVunqOUB839KkB1SUHzloL65vVoc?=
 =?us-ascii?Q?Esj6qMV6v2Gqwb7avu+LQ8j+V6HKzk9rvpVqP9vH7xOWIMpUhG5pbNiW+ljq?=
 =?us-ascii?Q?E8JpxCXTn4NiXG87NKErcnNTbTmW5qHfFRJgGA1K61dIkkELkZ6urdWnLk44?=
 =?us-ascii?Q?UEPAhsuBMndu+1RngTM2mfGn5jGzBveuI5qeSnjgxx+Nx8JpW+/2AgH1n0hd?=
 =?us-ascii?Q?GOEd0T8OHGRLT/Tyi7Gafrp3m6S9m6ERlHQMZXkL8vitLdrITcJy1gIT14+e?=
 =?us-ascii?Q?/Vr1kVWtMaVOycZpRMJb1+hYAixFLksW1+dOSLuLxtE5eWC3QNf/FeSl/7nB?=
 =?us-ascii?Q?CpuP+i+2+aHR4sZFrot+dY8OMt9lbFr3KaKs/aD2T8VEdbjYm5CutPjxonKf?=
 =?us-ascii?Q?XIth+kWirba1BUVrsuzYlJUFoYb+VIL7Kfcng3ezIQl91SLIiQVTIzanODNW?=
 =?us-ascii?Q?HHyUrsxR2AcUvQ7xiUTguHNHddZJfk1CfJcixkj+iID9O9DGiNhldS9zvQ0c?=
 =?us-ascii?Q?QDtUHF92NbT2/eSP5VFdLyziei16MPOFajPVSMsp3xBwo4z5puquRPCzI7NN?=
 =?us-ascii?Q?hVaXa/pVL8GhOZR6f8Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 704d9b81-dab7-489b-6f26-08db573a5c21
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 00:53:56.8245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k69NjNY8n0l9zZngniEQc+tgogYph5CGKQ4t3SXRcud+BESCbURxFiZvGhezb7jC4YfsiemJf0uHbqB08dH3tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8237
Subject: [virtio-comment] virtio networking collaboration meeting: call for agenda

Hi all,

At the moment to my knowledge, many TC members are working on many new feat=
ures for virtio network device specification - all of us working in paralle=
l.

I feel a biweekly meeting would help us virtio networking developers collab=
orate more effectively.
For example, we can discuss how do features each one is working on interact=
, what timeframe is each one targeting, etc.

I suggest:
- A biweekly meeting using google meet.
- Meeting agenda will be posted on list before a week so people
  will have a full week to review, respond on the existing mailing lists.
- If no agenda items for that meeting day, meeting will be cancelled.
- Minutes will be posted on list after a meeting.
- non-TC members can also join; this is an additional space to get input
  from outside experts, under the existing terms of OASIS feedback license.

- All decisions are still made by TC electronic ballot as usual. Proposed c=
ollaboration
  meetings are unrelated to TC ballot. The point is ability to collaborate,=
=20
  plan and split work better between developers working in the same spec ar=
ea.

For the first meeting, I propose the following agenda item:
- discuss new virtio net device features for 1.4 spec release

I suggest several day & time slots.
Days:
- Tue (May 30) or
- Wed (May 31)
Time:
- 2 pm GMT, or=20
- 5 am GMT

We can pick other time/day options as well depending on who wants to attend=
 and in which time zone.

If all this sounds interesting to you, if you would like to attend this and=
 hopefully future collaboration meetings,=20
please reply with email, cc to list:
a. preferred time slots that work for you.
b. any items you would like to add to above agenda.

Any other comments, suggestions?

Regards,
Parav Pandit

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

