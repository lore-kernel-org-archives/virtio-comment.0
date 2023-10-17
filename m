Return-Path: <virtio-comment-return-7755-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE22CDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 12:50:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6FC0729FC9
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 12:50:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 52263986859
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 12:50:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 378AE98684F; Tue, 17 Oct 2023 12:50:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 27951986850;
	Tue, 17 Oct 2023 12:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqzkdA3p58tLBQ6eb78IMqtn/8vIEG82nSJt+GaSbmXofzjTsWSi3SgnuNW/50V1LevR8Zlv289kecfmv5Bdat1PVLo0jtyeaQ1CtQuC49jxpXIalsdqyq/G4jSjL8S3pcdq7m5uQnP+o2X30DlCeFNrVwIXYkpesOJ4bmgdwd0XiAq/ztsCqydicE6zrbT/Vwik4TwDTXJmYwEkMrZMCL+zpOXhBtFo0slwm2dRVvsCXIQoEV3xOEQXFo6JNdzHEHhWA8czHEXsxYwdxWr13WkOMHxEXUXvcfUw065cX84cLsr4bGzqkmZy6UbxRJ1J26L/xdttPHeRE2NfzlO17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmfKKqfUDUXdSPOt9xHruwebq2ia4u92bMamWM0SnW0=;
 b=LI+0q5hqHZqKmhuJ5tNd4DRvQZEyrwG5mq09XE1IzT6RDYLpWj4ZGCqayOoeed6zRijzFoL3P28IrjC7bDg4A9ViUFG4ojuJi+CXnLpvOs4nHCkNY9GjH0Okvp7Qz8yGGPRFMbApVrubeTcbA2auV/RXDaO3YgxqEd+k33oveGGVvdI39/uM3ekx5kZn+DtwOtocToJydI0UWhD5FD1bNDce8PGkfBI91K46EPyOp4qlPhLr0fFbBdzq0hWnjKJx1Nn9KJrZV5wbdIOXChJTo1nxnqPnPg52hDLYh5fwF+6KcmoOtyqcGk/Lw222HteLWj97mD/EoVjZRwTdyd00yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] RE: [PATCH v3 0/2] Support enabling virtqueue
 after DRIVER_OK
Thread-Index: AQHZ9O+aMt9Foa96jkaKzO+VCfy5erA19cYggAyMF4CABKKDgIAG1DiAgAAOC2A=
Date: Tue, 17 Oct 2023 12:50:35 +0000
Message-ID:
 <PH0PR12MB5481BDE3862B92FF8ABD9DE5DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231002051601.6626-1-parav@nvidia.com>
 <PH0PR12MB5481828A211C0EE78AB63113DCC5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB54817941AFA95235ECEE745ADCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481879853042186FAF4787BDCD7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <874jipe9zy.fsf@redhat.com>
In-Reply-To: <874jipe9zy.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB6445:EE_
x-ms-office365-filtering-correlation-id: 9335bbc6-318d-43c7-d03e-08dbcf0fa7e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vsYF3i3MfPRRrSRBXyqxfy6XQJ3iJPIVTL0G9Y4KEthnk62qKcyo6cbMf6nSs0F320RyYqv59PJf26oCR3xr0GzIc+kkbadHaSDYZvpY6mA47DIFWvfrFzAHGob2NugWqS1vOrGZBImoKFlERqaDDenpivfy2DWYkLCiGCOcpgkiwjzKc8RTVpLgS/k6E/DZ14urYbiN8oiAlI+/9AUFZwpjIW//gkowfjOCSTGNx1+oa1yK7tyA7mr9+ahbXJqqH4cuOHCLflmzgdMBA+ZVc0r2AWFV8enF2B/CfrcMtSaZd/Ki+FJR+4VnqKaxOgZEp6ketkJW3tznwvvsnhB8XgoG3k9bpfSCzpGP8qPyGTN73Q6IMCE9i/Ub7WuKGPNM5mrWSKxE+b5Hjw2EuxZmZYm8HfBfGHMJGQf+yPZ01b385ucJcg0PIPgvL1priivCGDrd3aacCWM0yp9agksDszonISwSDWy91ssI/nefnCi3rKPXALAGK6c49AkoT2DKyDrUvDpSFInY4Bso+OYkCLZyiqi1oPmZJpPtAAkewakzL9YFFspCpzMb6kRqYp48MGMjJPzUAwfx4AAEjlTB1u4+opodI1qom+hUF07fnWwEXbcoS6oFZbiEZgBntwIxZwPT8U52YTQPIfiq7iBAvp2RKN/xk22rmZ/4sw9XMR4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(55236004)(7696005)(6506007)(55016003)(52536014)(5660300002)(2906002)(71200400001)(26005)(16799955002)(83380400001)(33656002)(9686003)(122000001)(38070700005)(38100700002)(86362001)(966005)(41300700001)(54906003)(64756008)(66946007)(66446008)(110136005)(66556008)(66476007)(76116006)(316002)(4326008)(8936002)(8676002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5clC921U5ZJPMraSP8D2yHhp3JQti1z16IG9rMmmln9CrnHPflTQnU4Z15vT?=
 =?us-ascii?Q?jYo5mXqBKA6o3C6yJU8V9BYWSlCahqUQv6HR3x9umxR3H9cd2lRGCzVt6A7m?=
 =?us-ascii?Q?16LYSjWajRqYAODqQanr00Despp8PN3t19jCfcFaQcm4LlBiRsrUqCSlSsBa?=
 =?us-ascii?Q?ZHbfKQPWef0Qiq+MjmYawo/iWPAipGUWHHXUIR+Fd2AXF/VFzuPXXwhk4BBD?=
 =?us-ascii?Q?AOp4E5qooEWUHF4UdmWGQKScwTq1SPYdSeeeZbLJWvKc3TLSlQUWKg8u0Gj5?=
 =?us-ascii?Q?iPadO6Z0frzFLmtvce49tzAVmEn7xdWE6978FiSzL/+K9v/qkBjdqnKYlD1R?=
 =?us-ascii?Q?zP3ELI6STaIhhzBwxrq8vuHz3/jHW/OIUS/2RE+bIeNcRRY9SHTiD5tIVCuE?=
 =?us-ascii?Q?ESS/VIA2c3RuFB9dAJxCHxorWRAXeS/uux32mXK1hEnC/hsPn1TbACaTs7vz?=
 =?us-ascii?Q?V9k7IaDDzoXtnCVfeRz5SfQvdpttGZp/3yGkHw5OJVJMIru+mPOgtXmLRMc/?=
 =?us-ascii?Q?NALVYbyCKStUWh/8hHKdz8a4XS3AE+rw6O1wHnaMmGv0B5fS5N4DK0U9BnJl?=
 =?us-ascii?Q?QHGFYNoFYe2qTdAZA3cZ2k/7orQ15rR6Q94zrhYkCH+s5Dn0OgtjmV8SsFX7?=
 =?us-ascii?Q?jyUGX69lLUw5e4pq5i0op5ksQWWOmk2A6N3ybfer/HShXqqnlzuStp6FfC3c?=
 =?us-ascii?Q?gjT3Oujc7WQSx8LBbz8Ocjl7d/SfNmTrgJueIcLQaoK9RBQJDrVAdfsc+2kz?=
 =?us-ascii?Q?VU/kR0UmPmQwxk9y8O6FPp0MMC8rMuOGnXKph/6iBHSxrEt2nXSf/ilmFT/n?=
 =?us-ascii?Q?cuO12HgM59/1ef72ez3TogCLXZKNOJ6QSQAgdL+jdCyaIb9yjwnP5CnsvuTQ?=
 =?us-ascii?Q?+OwvlaMuS214CusTgmFzg+NPPzE45GNjX8FPe7a0NEmGh3OqFwZ6vOrEMEV2?=
 =?us-ascii?Q?Yv3s79IoRFYfQvR7XAmMw37fmYrag63WzppXYOMCi61Lm2gsn+WJi/d5k73n?=
 =?us-ascii?Q?yR31m5PY2IuE/R+xuGvEVMqYLVFcbYVdmf0aGl5sFe7vFWWIyKyEedkjjDuT?=
 =?us-ascii?Q?/cd7SpVLxSBsg8dgmxwTCKmCsY4uaGQxk86I0Ak34KuyK/YSnyXrQk4FtmvU?=
 =?us-ascii?Q?Wg9Xle8l/rSYgokHzvAjlSeX71RVQYj7W6gnBFeM/IbvG3j1Zcm9P2Ejp9c1?=
 =?us-ascii?Q?+x+LXc5hIJZPJbub/S/J/JIjpGasKSxTDsIfUHOEZtwWsZ1k/Po4JweV3upW?=
 =?us-ascii?Q?XHRxGhARm5o09D4unToYaJyRj4G0L/tYUV1P4UtzS7WFNxhwSp+RiPMJ2rQ4?=
 =?us-ascii?Q?VWcqJ3YLq1up1kIbcJYzIKKTzmFEubTUnl1Q7HqQCPjR7NPJOisa9QG2OIkY?=
 =?us-ascii?Q?vlbZHjMCsyE11/33aKgCRacoOIfP3os34PUzfGjX8nWM3PSV4D8l+b2DLMVH?=
 =?us-ascii?Q?mI9hf9ZFyfEpoOgb5w3/UuSkTpzCTO89Rb2vnwwmHoXC8xcEjLI1MfL/hBv+?=
 =?us-ascii?Q?uVZYUwnqqx2lYyomi/5KWjsLUMoiyGksVXZJvBcvQ1oeAtx2ZrIJ4PCXEOsb?=
 =?us-ascii?Q?gCxbfhETdkC/kY+SFkk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9335bbc6-318d-43c7-d03e-08dbcf0fa7e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 12:50:35.1019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRyUTTXZwZjwGrsdS4/G6IhzukiRg1zz/IrkmsDu0sQxwFS6qF4wVE1GusFv3qjT8aafJdfT3uAMHXjkITPiWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6445
Subject: RE: [virtio-comment] RE: [PATCH v3 0/2] Support enabling virtqueue
 after DRIVER_OK


> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Tuesday, October 17, 2023 5:28 PM
>=20
> On Mon, Oct 16 2023, Parav Pandit <parav@nvidia.com> wrote:
>=20
> > + virtio TC.
> >
> > Hi Michael, Cornelia,
> >
> > Its been many days, the voting request is not raised for this small pat=
ch.
> >
> > Are you receiving this email?
> > By any chance, this email has gone to spam/junk directory in your mailb=
ox?
> >
> > Xuan, Eugenio acked so I at least two mailboxes received in non-junk
> directory.
> > I noticed ballot request created 5 days ago for github issue 175,
> https://www.oasis-open.org/committees/ballot.php?id=3D3798.
> >
> > I suspect that, this email is not reaching you for some reason.
> >
> > Added virtio TC to see if the 3rd ping reaches you.
> >
> > Flow filters feature is waiting for a while now which depends on this s=
eries as
> users are not able to scale their performance.
> >
> > Is there anything more to take care in this patch?
> > Please let me know if I need to fix something in this patch.
>=20
> This is the first time I noticed this, let me check.

Can you please confirm, if you notice this on virtio list or virtio-comment=
 list in your email client.
So that we can identify and fix the problem.
Eugenio and Xuan were able to see the email on virtio-comment.
It is also present on two mail bots too. So trying to find out what is wron=
g here.

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

