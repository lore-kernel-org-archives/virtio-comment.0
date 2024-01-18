Return-Path: <virtio-comment-return-8964-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD43C47077
	for <virtio-comment@archiver.kernel.org>; Thu, 18 Jan 2024 06:50:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4F6942B01F
	for <virtio-comment@archiver.kernel.org>; Thu, 18 Jan 2024 06:50:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 25B219867AF
	for <virtio-comment@archiver.kernel.org>; Thu, 18 Jan 2024 06:50:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 09C4F98671F; Thu, 18 Jan 2024 06:50:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 803D4986720
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 Jan 2024 06:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDL361M5vldmS1nm3OH24jlnt6FbrV705mhlY+6Z7jLfLmqsldUPRHSnBIxn7kjmXQBC9TK8JQhDTBbzks9Ogk88mxJyt/UTnd1HgTIRhmgNXCEI2S7Gti0fr8aYS/1VzyuoIuxwsDDVfw4XzeSmhK3cVgN+8mMSZ4G56UK0IIe8CZGZw+Bv8FkKeB5uRZQD1K6nGD3URUKsohZGSz2ioH0U60PNKZIEiK6rnUg+ybG1n2O8dZLeHFaaQHByTkP+z+2c3s0LQxujQrBv35B6xFgGgI9iJaYZXJXkXp3HPVRUhn7Fb2OVB4P7K04vckWCk+PolLBQLJY6oFZanwrfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgpQB5KgWFW+DKvlNjHqp1Cq1qxaAg4ZEfgJ4vr6tms=;
 b=UMBtomRaeP5AQ3NH+kArqMhRe+0ycO7c3vVnMcJQkrwkUWit9Xw947pPFB29KsmRzgBrzflXc792OMW0TLmnIO6a8CVod7mpzOq//ffbrM271ZNZM4Xc4lyH1kNpPURAXsYiOhI0lESJu/+phlZlwL/QNFeWLfZNQDpfPn7jfcj0zYWtc2SKv6+VjnJZeFx2/6AaA8Yk2fbQWIFE1e1TlQDie5G5+OO8szWX1e/OTHNSLQHqEwP/cvOF0tC4fysy/rZxxf4z9I1HJxG7AWT2q8qOkpE/DICY3tLiH+qJh8QL0JjdLWW6mDww8FkM86NVF2lfhXgz5zMNOF9kEFCTMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>
Thread-Topic: [virtio-comment] delta between branch 1.4 and master
Thread-Index: AdpJK7FIujQH1mpLTU6DyNV4z8ylxQAL8qaAAB+8F2A=
Date: Thu, 18 Jan 2024 06:49:45 +0000
Message-ID:
 <PH0PR12MB54816E95105B692BA8386568DC712@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481309BDFD5AAF958893481DC722@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87a5p4m0ig.fsf@redhat.com>
In-Reply-To: <87a5p4m0ig.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY5PR12MB9053:EE_
x-ms-office365-filtering-correlation-id: 8171d707-0ae9-4eb5-53d9-08dc17f1a80a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5wrfA0ePgDITU27SoBwOu0wyHjK4TRvtn4PgPMxPQ348PFMkZoGOxGSYfeSTjhJrcZD6c1NbYk7B5lhDjDNjA2lBxa3hula/uNCZLly8mYaWAxzwlTyksYjdnaXDj1YQa7jD6Vtep3Lc0SI8SRN4Q7qMsGVRVej4LxBDbhO8Ydje86LNEp089+wpFwdiR7OQeplsH3G35N1k/OX58z7Cyte3N8d8SW9e+f0z8Sd9m2QLIxu9vihHtFxgpbYwrvNybARFgGK6FqkO1mTmOMFfd4xIMynKC8zrTu99/fbdf5NGvMYqN1pA5KhaMLOzBe/gLDeaM0w21716eaecgCt1mngLHM7QJl+MJAlXHpTi0rRpVLXqGOoSngKEmYQIu0SLzjYYh2vFI/IVofzWnDR5fu7sXlPdxlmUAVAqNixwZD6ZeuX4KM0tNihcboGLfF+94Tmxx1HcdOl+YhYMcXzU6pVSJYpDFCg3RE4Mi0XANV8680CdY3d67nhO+XXzYeir4PAmUoHxROteV5cqb3h22TzWeaoINaPvVGSzg1AK3jOxm2adrrNqlPC3wdVpuARV0fTwHFRBylQOWX63RgMhKHzgCex/6ypa2Ap3c5a74eZmxXZcKDDmwoYulrnYbekB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(86362001)(478600001)(9686003)(55016003)(316002)(41300700001)(71200400001)(2906002)(6506007)(33656002)(7696005)(55236004)(38070700009)(4744005)(66446008)(66946007)(66476007)(5660300002)(76116006)(66556008)(64756008)(83380400001)(110136005)(38100700002)(8676002)(8936002)(52536014)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?h2cvKmua/GJBQnrFOMmZLsCma4mZONc2zeebuWBMqoWQMyudPiwMYOeMLdto?=
 =?us-ascii?Q?f5/Zl+WgcV31PntiWiEunxQNrmATOWEgpxo32cg4TR9OCSYQdcmf4/BT+ugb?=
 =?us-ascii?Q?IXOGJEiTCpl0dFZZQoPOeAsZZq1h4ndotRvXJ66Tmgxk9SFZ2e66PZhRj36V?=
 =?us-ascii?Q?srfi4M7bKufyuLYI9HA0osfADzj8Fmb5bsN31c3phGP1etAZFw9O+m3tvpF+?=
 =?us-ascii?Q?meR+E+cOa0mVv+h2wVax+cz+XWARBcxkfLoU5tmUyxm8IuzKldqcwtjf34qd?=
 =?us-ascii?Q?Sc5EKX/24jrXddZZeCrGHEdfwlO1Iy+kDUb+MQFfzW3+Vo//+EU0VbjRhsjg?=
 =?us-ascii?Q?hauxisZ0RcSe8Am/LqrqweivkW3t25bS727mVLWVpmOcSFCws4jcM96lIjyC?=
 =?us-ascii?Q?dagPtWSetAnevnvkRbbMDILQgl1KOzADLjSphO4FiuB+UIUBJUpYRCuSH2Kl?=
 =?us-ascii?Q?dPM4qfYrBzcrAVrdsPq2KLG69Bim/lhtkFK24hvcggkTzRxuY5B9X9iqfkf2?=
 =?us-ascii?Q?59TFMzpBydcxf88DHJSgdiOqLk+rrHhrhF/gU/1ecR552cd5ghwiQMNRDprL?=
 =?us-ascii?Q?0EYen0w8gtDjHQdy+RHtX2NDlzlqShl7wZV30RPPrNa81+uAgFw0PrSJ/4B7?=
 =?us-ascii?Q?XaXv6EARi0IpMqN1o8PYmNWO8YqDLepfgMAoKZ2QRdcO/KB2ctePGpAAVMvD?=
 =?us-ascii?Q?9jhizDw/gXkPg5VZuH5unntgcKo3ccTgedBo1pZhrDvl9umwH2k7AYIJ7khf?=
 =?us-ascii?Q?rQnXx7DihtLpSYyrJEnsA36K+ZUQfBN5jimONlzbLLrvUgrL70dwk1n1vqlb?=
 =?us-ascii?Q?RJD44XM4CGu8OW0wgfd8+qB0KiIrEoDVIXN7yhcXZGYb0ASH1pPYHbDoYNjS?=
 =?us-ascii?Q?lUx3Ia+LBuxBkc+a163tS04GqF6EvC56u2hxZaNfseSV3JJsGqGGNdkwpe6l?=
 =?us-ascii?Q?kDOVH43/PBd2nVZTvRWbcIn31RtLNudFpOaf0FQGOdbPm3x2P0U5C9L2DZLy?=
 =?us-ascii?Q?AgfTzWt1Ay2HuAOfVY0tgAjF8JsQFlrt4VmYzZXqclkn4pt6cd5UQ2Cy3Mh+?=
 =?us-ascii?Q?ULHmAKYMbRmo14hHyTEF5raWynj2jNwtBwUEGtkdRgYllVzQpYcQ7WfocB01?=
 =?us-ascii?Q?Hs4EKL3mv7J4awdf+VgKFR5peoyKYndiSIR0XhTycSMXKt4L4B06nf59skfC?=
 =?us-ascii?Q?To+cCaGlaLVeypvdGr5YXmeWdzZdD0K/yzwr2uhglOaDypGOvziJvNeOr+l0?=
 =?us-ascii?Q?o81eqFMvrPZ2qn+arFWyb2rX3FS/JhdH1GmD7OhQAu94pCVqJKrpvmKLwvbI?=
 =?us-ascii?Q?L6CCD27Z3YuovJ14VA0fpeGU5M78nKak5lVtvBr0w9jdPM9h+jkDCE1FjOX1?=
 =?us-ascii?Q?lxjEeIfuCc1XfqrME+x9OAo8eOHYxX8G8W2vcNlGxkrYU6S7F4nU6Jc85v86?=
 =?us-ascii?Q?GoC+n54oWGNeogR4Xst09iGGfUpV4j81jaeNQgwWHSSBcX1ujqOtJ2LZ6y/J?=
 =?us-ascii?Q?NwTDb4GKMoA17fmA2/GiliFVYI3kZ6FKnzSsGfrDPRfYBaFVfySg3EWRjOs+?=
 =?us-ascii?Q?sIaZeLfIP7ffSm8EJoQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8171d707-0ae9-4eb5-53d9-08dc17f1a80a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 06:49:45.3175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FRSkklmAqel2JBsLkWtlTfqjjwxGrl5+OjYyMxy6L5eJx6BY/xzsvhjviTFN5U69qIAAg4QvJdKS0pMMj5Lmyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9053
Subject: RE: [virtio-comment] delta between branch 1.4 and master



> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Wednesday, January 17, 2024 9:10 PM
>=20
> On Wed, Jan 17 2024, Parav Pandit <parav@nvidia.com> wrote:
>=20
> > Hi Cornelia,
> >
> > Currently virtio spec, 1.4 branch has 6 patches which are not present i=
n
> master.
> > And master branch has 16 patches which are not present in 1.4 branch.
> >
> > Is there a plan to sync both the trees?
> > Patches should be sent against which branch master or 1.4?
>=20
> This situation will be resolved by merging the 1.4 branch into master -- =
once
> 1.3 is finally done, which is waiting on voting and OASIS processes, whic=
h is
> waiting on the OASIS infrastructure migration... really sorry about the l=
ong
> delay, but if I had opened a vote, I'm sure that Murphy would have schedu=
led
> the migration right in the middle of the voting period. I will update onc=
e I
> have news.
>=20
> If you have any patches, please base them on the 1.4 branch.

Ok. Will use 1.4 branch. Thank you for the updates.

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

