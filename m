Return-Path: <virtio-comment-return-8570-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD629C61D85
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 10:22:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E50F12AEEA
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 10:22:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF82D9868A6
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 10:22:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A23F79868A2; Thu, 23 Nov 2023 10:22:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 92D079868A3
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Nov 2023 10:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLH/apTU+RyCXIrQ8zxJZG8r6YFAi62RheP5UH6k48vsdnSkiHJ3A2F9zcDT4/WJkQIkm1sYMFWNoVRfZbSfIz1SRlKa7ob7Zd+qOwGkF1OzdTCunNNYv4hGhVoCS+0tQR7VG4V7GfwGciH1GPJLDIWm6/7cjrgOdZulR6bPq41ZzQtpZKl/fnTzsPEydQxS4C5v2KPaU367UtUI+K29UCsQmMaWrKaAcjE4Se/fhot/uglVOU4iASH+lrOa1YrSGIyzwZ4ID2MioEyCqpgfecCMoqX3Si0/s7AzcChsDv0+PLPdw7fmK9cSUtwMJU9gMIg5kWbfaQNuc+dvsgeJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H82t5kaTWr93fXXYPA/OyrrMtiz+s4ZYtCXalxhlFME=;
 b=JuXigN9GiJO4T2s9dY7HcKNmi76gOg923PYrf+Ku88Q9RyC6TE56G9UkNHl/sTAnYX2tejqf2Rw/KkJ1UKx0lpcDNsPVkvpP8WKKTroeQ+EkWbL2BnzuROTqcUhB1RPc/qHHtNEBdiB8duUXXG73fO46TsTNH7EYgKS4L39OlYk1sWA4wZwB2nNx+mMcRoGdBVvRbN53zjKlcNiDE+alllPyNQCVKwJDRthN2yW3ffv6hJf9aOrWqFrAsNH3picyeUhC5LR9P4mQylLktE3nGkg9NvT5DS4tRkeOSpGkfDf2cHKljT5FVtfPtUmr4Glo8xqwOvl0ehaW/HDrHng4QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>
CC: "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Thread-Topic: [PATCH v6 0/5] virtio-net: Support flow filter for receive
 packets
Thread-Index: AQHaE9LvQ+6uKAfIN0Kopom3Mm7xhLCC0snAgANzHgCAAX/Q8A==
Date: Thu, 23 Nov 2023 10:22:17 +0000
Message-ID:
 <PH0PR12MB548169D2C55CB67D7E486952DCB9A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <PH0PR12MB54817956B291856378B4B013DCB4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87cyw2kozt.fsf@redhat.com>
In-Reply-To: <87cyw2kozt.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB6846:EE_
x-ms-office365-filtering-correlation-id: 67fc3963-9574-41df-c43c-08dbec0e11f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7uN6Xmdt18JViFwDgYA47dJy2ANvGIBgrsyzpm0S7iE9MyBemiSEFnqylT9H3Pps4/o65HdEYw+R3YJaT86q/08OIYSah8wx+aAFc8eVAuUhrpw1zqrTkApx5acnW1uTb344N9t0oPs6yzT4FieizxiFTUbJGCb5W3zw1hXqGeUqBuKXJDo9Sok1TS9WnazhcMjQBaqZSUsGQVtoNa1yDnCkhcWQgp+nQv1yX6lJAfgdFSY7yAH4HrJp8OxN36UQKPVLJFkVmJGtpO9NqEN4SEYUZVf4CS9xqvvHUMBMOPIHUaLDpUySPr9jwu/248NiO9YeEWYZo/OBVjD0K04DUHPs0lEQKoZ6B8UbTmdWFVezCjOS5kQKKeGFGFD6B9fJyXHrs+WuKAqcDo1DCDGaqqz0nFdOYIXj/toso9T7HD2lIxna9LpcZjUlOZltVCzi5DuSc0de06wIOklkSIQ33jtYPpNOtyGPl45erpP/yAZNttBmqyz0BVGPR9M3qcRBP3lMoVVk1c1W1ujJR1caDa3At83gj+lERQVy98rtH/BN7ftYTA+wgruwgt8q289sjp6VxvElvIbMnPWZmFAMzyHlq4YPAwtJeP168NmXEIbx4L9Gbalq6Qx78hLccAeaHXipVJVInlxOCdOtPy1fyNCiMt7MBIsVBL0rSpShFaM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(366004)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(4744005)(5660300002)(2906002)(52536014)(4326008)(41300700001)(66556008)(316002)(76116006)(64756008)(110136005)(8676002)(66446008)(8936002)(66476007)(55016003)(966005)(71200400001)(7696005)(6506007)(478600001)(66946007)(9686003)(54906003)(26005)(83380400001)(38100700002)(86362001)(38070700009)(122000001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MXXLGnX/I+8KXFkl9q6cVlvrgNnTJf20Xtk87kctTb2zQWP+Go6t5eH//cks?=
 =?us-ascii?Q?1jEOdVknFBeLIY6rYFf4xC+Csrstx2AbjLPLYaaRn5z8VCNbkCwJ6eHiY7pQ?=
 =?us-ascii?Q?AW2aQyoOGM80TwvwgYV/Q0k2Mry85oG+lFSttMKU6LLBL5S8/3hDp9+hA5pv?=
 =?us-ascii?Q?+/3iEeK5sEUNrM+YjzRnsDaeV1pclAJmukUNE9hx7kjGdot3+4mYZ1N1B+i7?=
 =?us-ascii?Q?qTWZ3yjrxjZ165sTj343RQB+C1uplZ9C0c4tpdMPngn65jMJ64N/thPhGj68?=
 =?us-ascii?Q?4pihKu7ftGH8PbIftT0nuGjbLyX+4NUvqVpIEQfa+hQFumxuWVqnzRme4ddI?=
 =?us-ascii?Q?gMJFIO1G7Rp4uO5/Z9pOAD7GlGggb/FYq2eDdpEgQHk7gAE5qnLgOUiMyW51?=
 =?us-ascii?Q?kjk8pTX6pH2mX8/bya9yGyraqxGZaTz+BLgWIzArm0nrAqkgb5l16TCO0fOy?=
 =?us-ascii?Q?WnoFdd+lHb8jMQ1F5N0G/gY01bxJvhHC6PD4COu7VJHm8z8o5MsJ2AfbFZ9X?=
 =?us-ascii?Q?IcR+9DhNu49ok69fZtNzMPZeDLKyb7iom10tIWfY444I4IplX4waSfDGRAc1?=
 =?us-ascii?Q?4cIncdMkF1wGrI8Q4mQs0MgXZn/u8WvKrX3dsDcgrgcts/+YFMRZY/oAN5Dk?=
 =?us-ascii?Q?QRbVpHyjzDuCbsTEj5GFlCEGSd4Y78msTsS1BHKX6X5MIDPxb4kFZe6PiiDV?=
 =?us-ascii?Q?iL07S878t/I4hIYymVjiqgpKZm69gQ4jbVs9PZ6z4A/p4PmtaSzBJU5RTyXU?=
 =?us-ascii?Q?BhLU22MACQbA5bt1Mqj6nESJ2FIUEu+FPLkjr/Izwos4OH1TdhRIsC5RET2q?=
 =?us-ascii?Q?Y+xnmf+TdPjf1TUE7a9Ue6bIB801QYknvYql5QP386jWUft1D6xW3MEb2LY8?=
 =?us-ascii?Q?OzsMC/fEL90c7UBC3Cx5cabedUIABXvq+QIhyLesRXXAUMBKfUXD7qhajJqu?=
 =?us-ascii?Q?uNTr4Cw9q2CoCc5wmTZq/OzlpKmPdNXRDKznPi/eE62ykimnM+g2XgxSTHbW?=
 =?us-ascii?Q?YhjlJVZqm/hA6DUiLmRphTMR2cH85IaNhPCTTFGIKtYKfOrjmIvjL+6k7DuG?=
 =?us-ascii?Q?MrYYzhvq0QkS0Q7Xlkrek4BGtYpq7AEC4CznUgZbZbbROzGwH+OrAtEa/BFJ?=
 =?us-ascii?Q?VMEeO0DzE3OgpvIq+P+WDNRC5tji6KrA+sQ3+y1zJ8b/LQSQpyd89/Dso1Rp?=
 =?us-ascii?Q?g3ngXt4Bwnfu7FOB9G1VcXWL7ptyf9/GPsIms3FBKioOk4Qfr3un8PRn3mzZ?=
 =?us-ascii?Q?n/xZLYtTaykNUxrcPLZ5/3d+9osPf8/ij3g9jLYpPqvAgwr0yySiQ0cs64Aq?=
 =?us-ascii?Q?BGuCFU+zdFXiHlvawdRnnUIfo7DjBEq9rjYR0ECyV9rQdJZ4rP5SlBb2XZOI?=
 =?us-ascii?Q?O57LtKLoKcxvt64/fxwnabFAOVWcfNCeXNOamwq43yPidiWRzUjS7s/BV/9d?=
 =?us-ascii?Q?oSlIvP1L3JG4jTOhQjoJ16/Dxe3R6gk7oNRu9WtcI9q4Sue2Npz1iSZ2SrI2?=
 =?us-ascii?Q?oyFo87+7WisyvKjW3Qi18Q/kaMpe5tF4Y6Q/+s9iP7316ktNSs23p+Yws45N?=
 =?us-ascii?Q?ErSxuD8GzT6VrkZFoBk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fc3963-9574-41df-c43c-08dbec0e11f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 10:22:17.7212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gNRPXJG/AwpKrK6JXkx+TxY9WfRoctHCMhrqiyjPr7QKh6E82f09afjch35tJqDrhSIKZPlN/lonl4JJPetNaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6846
Subject: [virtio-comment] RE: [PATCH v6 0/5] virtio-net: Support flow filter for receive
 packets

Hi Cornelia,

> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Wednesday, November 22, 2023 4:57 PM

[..]

> etc.) Would you prefer a respin, or a vote now and an editorial patch on =
top?
> I can either comment now, or start voting.

I fixed all your comments in v7 at [1].
They are bit better now.
Updated the change log of v7 and github link too.

[1] https://lists.oasis-open.org/archives/virtio-comment/202311/msg00500.ht=
ml

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

