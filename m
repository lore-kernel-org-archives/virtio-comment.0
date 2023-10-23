Return-Path: <virtio-comment-return-7919-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3BAC001E0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 14:00:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 42EFF12F6AB
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 14:00:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24B60986697
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 14:00:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 13294986677; Mon, 23 Oct 2023 14:00:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 04526986678
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 14:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZC+OxQ9XxY0wcOiFPt/fy6lxnSnaoeTX1NhM1GedjuC21/AhZwJOVFbx4hYHLC9O5vmGUpEOvL+voztULrBtCX2wmJs4m79xRVeek9TI31LHVXlWb7ZC98dkuxLwD5UBqJJGiABSDZmpvs6o+G5XvUSlUuKX6XlVWTBxhPw34cbzLAnLj60DaboIY43xxFAVIu9dZzxd04W5ntEER0rWcXc3W6CqBm2jtnTEYCFiMkMftQdkyRBWKFeCvB36E4QsV4h9Wd0gBgUhlBzA8QA3JbWf021feW322iguDlM3tgVza70/LN7OhB5Va0+CbVwJZfe+raM+KXbGmViLgOm8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nmvOA6me10VVFnjJdSM37l4s1blpr+Hp6Dky9sdOek=;
 b=YMtC8rkusB4NiHnyR3RGG17eHKY/1J3gh0d/2vQ9JtZhO/DY1ZXr+bj70yV/hhhszns7BSYJkN9CJ3bYNqjOqaMWXy9ALgHBbkqsne5DncNW27/nMBhoR1gadt5k/GYjN7fvhN57qLkfOmRk4/ZPtVk7YeWavKS/dXs/zfAqQ0RIMKEOqJz3NzvkpgMDYVun234EBxGMd28xSxSCvyHdkEIUHeiOXUgTphPHlML8LrNevZKv+jHezqAGceVuIyyZra0igObuIeuQapnknmOXmaWHRN/NRlQY3Iy3/9xinRbSmDpq/zSpPhWsdYr1FhWZ+V+xvDiwZ8u0OQ1I4HT92w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFw
Date: Mon, 23 Oct 2023 14:00:17 +0000
Message-ID:
 <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com> <871qdte8r6.fsf@redhat.com>
 <PH0PR12MB54812DF4DB53917D4895FFCADCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87sf68cjn0.fsf@redhat.com> <20231018062704-mutt-send-email-mst@kernel.org>
 <87pm1cchuq.fsf@redhat.com>
 <PH0PR12MB5481DB9D38E58522F0B15EEFDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548188345E2CF3B8AA5E2DEDDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87zg09bfwg.fsf@redhat.com>
In-Reply-To: <87zg09bfwg.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB6610:EE_
x-ms-office365-filtering-correlation-id: 49808d00-e33c-4896-1890-08dbd3d06315
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BpsP/Laf2VC0HXwNkdSyTyCya7UI3jjIEakhsi97vRUsUIV7TvaIoYUnX7+wKv21GLg5aiRu1FSocvAeRUoSTPIfDIh2cFSGXRDLb5B+507U5OQCdMBfjrLHyOCWQMpfcnOhQuI30wQARTWdNtNR7vEDQlAJhlG2dMKcX5xrrtYARRWIpmGInVxWtaTVhiUSL4ibAtgo1vAoq0gQd+gsqPXHViVIzXhj3oXhWbM/RujYA6py3CCuxputzChtH+L3RjFUIwyq5fe95FAYmCzOueRt8tsLTPk3WmlMFPmk7tr/M4qen909DA/KFuX+QnSMOjmQP78Eis0xiysISBkhgrUWsE1dByx9L53FFnTt64Njeghvan0vzvLeGa9Bp+2NUuLJQnzSQt+0WIsPLxoqcc3Dyzd2lupRJfpSy0q1jqsDQRWXDT+ilkFJWLLGHXY8B2cDkg6lbNtWK0j8V75u47qazlFOVrMwTPKx0vbBogh2XcdFAdekcycXeYJ0hyF2Ef7fzRfsM2m+V3b+xcjB754RycrdY3m8MuAZkqoZTDSpDoWD9u+ae5EXMN+iqMtwdSYSMOtY8+5jP17yhweJDs+1Ps/7/XuachwtCBzWX0Vdxwm3YBoQlDuJOMdM8U4xvqYHjSyEnCrYvoZ66rFipKYeuauU7hI5Q635EIz7QpKjcopYcNYjkcAbGKVEfWnlH/Txk3WkfQ3Z549aPjnv1Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(71200400001)(38070700009)(107886003)(26005)(8676002)(8936002)(122000001)(4326008)(5660300002)(52536014)(76116006)(110136005)(41300700001)(316002)(2906002)(4744005)(66476007)(38100700002)(64756008)(66946007)(66446008)(54906003)(66556008)(55016003)(33656002)(6506007)(9686003)(7696005)(55236004)(966005)(478600001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KTC1iEMk+K8+D95LWNBfwYS6o+ykivageyH/ymFdzmBRquhn4fSatBQwBeRx?=
 =?us-ascii?Q?p5V1p17NXsrutBKdF/p1uh4NvnL/+eNlM0JInLR6i/udmV9Y5QiME//F64cV?=
 =?us-ascii?Q?fjXnTc8HdSzW0mYsc6pQ1m/kEbanrc0qcXzH0wESsN8db/CsYJ60LafC4JQV?=
 =?us-ascii?Q?HA5j0S1VAq303KMQwNvL5Tn9XLc+6GRNvmAeOWf9eDytiG7ZLKwItgRpZv5e?=
 =?us-ascii?Q?x4/G1Dj3QQXjzeCESyN7mWrPNNtOB9QHMvzTi/uqEGzdNX+/ReK36xXp1yva?=
 =?us-ascii?Q?lV8DhSjEGf+k+Yc+17BQOjsF0tKLcY9k4rR909ncDuFfNO8MXHu/gN6NYDrD?=
 =?us-ascii?Q?o9WZIpxXoIrT6/fyu73Zc7rCE8+5N4b14Y5acqKpMctCGvFaRxaYQU43ymZk?=
 =?us-ascii?Q?woM+DVz5hDMEwYTmCFXO2WF53CefX2A7CATAhhqYz9QqGtOaIHgLekh2znhX?=
 =?us-ascii?Q?/ENwxBkuKmfOmKFfR2H3jZIqyG8II/murkR2U4tpyoRiophBteuqkmnqhlc5?=
 =?us-ascii?Q?z1PaqcfQeOJIOoPnJ/P3dPY4TpVOBhdYz9AawHLItsN2CFi90B9y1qBRE7A+?=
 =?us-ascii?Q?Orfi3C2Phz0if9zw+WA7nUn8z6oa/E28mXvUEq4OSWqkuTjLQMNzGrRYYTTg?=
 =?us-ascii?Q?tbY6evw4jGzqCnm3cf1YijTpSNRnmP8LREGI0v1omrAD+DhIGPwqtO33Ftyj?=
 =?us-ascii?Q?KR8rwlCI8rcL92XRk0rYeYepNGVvNKjCo7RoATPiYiHvHrYeieyEhpLcp/FR?=
 =?us-ascii?Q?zFyxlAFV+GjJn6Yxidbc7RuXj8BbjlKsT+zxQbwUTSolhpFaGcU0lt1xMwLz?=
 =?us-ascii?Q?TqQlo3FLYtN14HbaO0tZ6LaSYkkn3nNYnG9cHoKTRuz3ic0S7Ir2h5pwp6KW?=
 =?us-ascii?Q?xB0CVu0w/diCXfGdHG0xTV8uIMJzHd3vwElcEgDKsS7L7AQDbU+rtjAbkndF?=
 =?us-ascii?Q?BvrbKjelF3HTLckxUe/28UbneevjVzAnf65+8R/qTfMOyU6ReTxWWj7jpQSP?=
 =?us-ascii?Q?v2Kptdhb44m5kSR0x5PQv/z6RishPgjR7kJUkRHSVrJG+rpiUhS8RiGNnZ6i?=
 =?us-ascii?Q?JkMlEa5LgW9ZGjnjxvcBk+4iExybLnXlAXE/QH/vZns1s9aYSjwUlhPN0B+3?=
 =?us-ascii?Q?XHg6r2qa09/C5PLqvxp6CR3v81YjJ6SX4dbMHAj6mROvheFUdtyZyqtgfrTl?=
 =?us-ascii?Q?egsKFfWUY5eMq9uQL8pjIZRhipgjdKquzgKRNSINmAuf+Y22IGTyKQXqUinL?=
 =?us-ascii?Q?qHqcp9odJFghnT3l3rNH7kg2cBtAnQa/pawV76un25vACQaipxYBIvdDVmgl?=
 =?us-ascii?Q?h8Accnrnz6em6GDkPPw7r/28CYKyfMEXw69KkT67u/XlCvxEw/nR0+MPTgkV?=
 =?us-ascii?Q?EGvKba+Y9/+WeMYVEQ9M7yvSnHJReBK3NMIimBYXpIs9vtM9jPDunqMuAr2w?=
 =?us-ascii?Q?/RLZBlrAUt/+K2Rw0ltRHfqSf1TjdP9GAXlo71I/i5U5ALAcAXxVAUoCRCS0?=
 =?us-ascii?Q?s8g/LhGariD9jJTACZxrVVqUFP9XiP9s6cSDx+dUKd5mnXEXHdpXMDvtlSaV?=
 =?us-ascii?Q?18/HDR6SXTWDdh+2CgA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49808d00-e33c-4896-1890-08dbd3d06315
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 14:00:17.1883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8IcysmEmvrAfCaK6uEJUXt6wL/K+AGPSwKJUFU4xD5KuQZ6tRZ0Q6bmTTzcEjKpSIxb7zGjkGUlOL2QmXuW8FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6610
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage


> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Cornelia Huck
> Sent: Monday, October 23, 2023 7:27 PM

> Well, there are  still comments from me here that post-date v4 (please wa=
it for
> a bit before posting another version!), so I'll continue waiting for them=
 to be
> addressed first.
The last one was [1].
Which I replied few days ago at [2].

[1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00240.ht=
ml
[2] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00242.ht=
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

