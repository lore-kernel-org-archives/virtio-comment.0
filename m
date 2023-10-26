Return-Path: <virtio-comment-return-7976-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1B8C25B48
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:47:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2083B2B143
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:47:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 08851986A50
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:47:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E91BD986A49; Thu, 26 Oct 2023 06:47:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D8329986A4A
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 06:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRSd+NdHhyTiE7MpIXS/g7X+Rd6QBvw+xoxLUrgYvpH5EHAHUFJdQzeGs8qduxaXJo4ZBwyGulaES/K8lrDYRo3s3t16AAsBMY4ygUPZyArec4rQQTsTeqY+8hDYMVQovfb3LHfRpCRgDJzM5uyZ2g0AFvnQken9fJqkj87jwSeibPBKQiPvBo1Liwg0Z0nbRbMmbqUfXktQ5uP8krmyjKkB0rZMWu3Pm62GRVKcgnOi8lEwY3kXHVDdwMrwkhOSSc3M3d30YZ9VU/wkNslW1UgUGp6ZyKHiLi2n7TjwBp1UPm9yQ6+gS10UjKauwGwpPv8/Y6w4GXJ3TprEqxIRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETsAmSaE3U4SLmBnh/iW92zeHF96Vpli7dho87Et9z0=;
 b=h3CsAdHMbo9GSkP+INcWHrFRaq9WQSzLtwpnHL8PTd6/V8+KM/djuK3glnSwEP58/lNrhm1TGcxgwUXghS4cH2kPiO6MdES9mTgjjkyukLw/G6hMT55oBs3r69/i0nXfjvTPPdboznO6Yb+YNpluZtvJNIPQp1b+ZB5bgj1TEIzZI8cun4f3vA5eH1Bol80i5YG9T6Ca2KUefovSE0GJkVAv4dz4GygYL001APaM2pouzpn+sXCSvwgKDoluh22PbI9X5bnFtrC/fQeSJoAI7B9Gr0vv4D90Mq+9/ERceWb+dR9nNfyV0h1sWGIdSjOZ2SzurpzZMtDhpwibnprfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IIAAA0oAgAADzbCAAss+gIAACFOAgAEc2TCAACXpgIAAAYlggAAK5QCAAAYB8A==
Date: Thu, 26 Oct 2023 06:47:29 +0000
Message-ID:
 <PH0PR12MB54819A0747E74D87958BA8B6DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmvdbehg.fsf@redhat.com>
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026022349-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231026022349-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY8PR12MB7169:EE_
x-ms-office365-filtering-correlation-id: 6fcb1a1a-b52c-41e4-8990-08dbd5ef6c7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yoftXEhEV4o/3AJ3pe1GPnYBgAna2myt+AjiBJnl3gpSQZ8f/Yxmn4zD+G4AhLNu93w2x9eJmg8gjdCe80Y9vKXjGI2uCfn6lxgQVrAPw+2BxKT7eV/g+K28pRdcxHKlFpiRoPhET2CM21DtmxM5wj84UJBFA/qmrxJJlvDGhfdBWuuYn1IZipBTWrTUEW8mDoHugg92sFQaPEfZqU+RSVevPd6lWFf9umm8BCJoWRqRWf41+o1LGSI5Xd0HP1UJc3KP6yUDKCqrcSqGIu6P8M0YxKo8qy5VSoqP1aAbgptHpyOrSfiiC261t/IHr7vCaM+6P3L+sc09strRfvtwwZomBCHhdISntd5uILLEb/JpjX7mMTEbIpejMNCKAfv+x3K6FF2UjAH0u7IEkmDKUSPOFzBHB+m2nzZlViPWXK1wD5+b7C9U0vw3VF/ZEdBLgT4G49ue3RVhDYlIMmel48Y7RjlSO/ROEi8J/fQNpCKeWwxJ8Wkrz23Q7jrLpoGIJvuSiUxZoDYsGkwrmmiPfCR6kGuyv5Phfb6mvlvEiZL63P6I3IIucyciHR94vNQPIP8HnHyKc+yMaN4ketOe4xAHxkPFfL06stPsU9u8jLa21bgJkcz64QtXGHZjTa/I
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(52536014)(55016003)(7696005)(71200400001)(478600001)(6506007)(107886003)(66476007)(66556008)(76116006)(54906003)(64756008)(122000001)(66446008)(66946007)(9686003)(6916009)(86362001)(33656002)(26005)(38100700002)(41300700001)(8676002)(8936002)(4326008)(38070700009)(316002)(5660300002)(2906002)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0I1Mrc/F834vKF2mUxu7cnBMSXdrnWMGRvmLD8xwWt5Pj2uBH26NfbNSPDQc?=
 =?us-ascii?Q?u6IQ7EToZ7jelQRKqFkNp0U4ovQ2YYDiHuu2zr0HEhWFxhO2z6arP0FlVTBh?=
 =?us-ascii?Q?G90+SAL0b2t+49IfcQKVY8qBo1mhFsNm5gptBtRacbQkbzKnPEPKPVhGacs9?=
 =?us-ascii?Q?f9J9e++LDw1OZ7f6fCVbruG3KHd4rX9Z7ewBljkShh3Sns1ytMRr1y3ALAOv?=
 =?us-ascii?Q?zzUo1bPx2MolMk3VGQXDYH4im1F3cqUlH25sfFTbykrtzourLvgJJIN4bR7n?=
 =?us-ascii?Q?M9+Ov8xWBCNEvd4HYgp3vcoIFtMs8nOGxxLhMyWKQotaAGKCtZ6/mkMdFBkP?=
 =?us-ascii?Q?fQ6FJEJxUB17hersDRqwY2WhcUv0Ym1N0Cv8JRNfxYKOravXtglyTTsyCU2G?=
 =?us-ascii?Q?H4dBadJypl4fFz+IRjDqS4qyQaHGODIMe9JLJPJKFaTTbe1SA0/BJiq9bK0u?=
 =?us-ascii?Q?I8UMwHsMa+MOb7DztRsT3S/8DCWFoSncj4DZEOkCtMrBE+F5WYNUK7kYtw9l?=
 =?us-ascii?Q?uTN2d52QaOaTbTAdCYipsEUG1l+STsAuTwbcuU2n42W3E7HmMp3JH5ZluYNm?=
 =?us-ascii?Q?tF6dMOORvWIXBti4kJZjqc9v6/YdD3EEx4MTskFV1hOmQqRi/My9smdIGBpr?=
 =?us-ascii?Q?bLdSTweSIaMrCHP7tRrfYbQ7EyoZ2wp5SpSmHOF0/XIUSTdDhyjI0DmD45Ze?=
 =?us-ascii?Q?x3ov7we/fkDPecZVl6y/4Xsku3SV+fqghH3YEBCyZW9De0i0+79pocIUwWIv?=
 =?us-ascii?Q?VQADDC/IulPCydXuGCwRcVa1gsLMYUKmjgZ3IzTx0ODlIJSegDqP6icG4UVZ?=
 =?us-ascii?Q?a+Mn3wzEOz39zoN3foN2700TJf/Opg9fnwCRFdCyrOMJQC8IYhJS0jLxKU03?=
 =?us-ascii?Q?FSab7kGW/U35BbvwzRxA/7J/XXpDK1FzDz/YmSxvVFVr2XO3g8sAcxmALbma?=
 =?us-ascii?Q?o89nQ99HB+anQ1bnpQGPY0rJBnWpOro+jN15BIa0xPatmiGnvCHbC4o9W9w/?=
 =?us-ascii?Q?bItKEQ/GrcUpTGoIU2pCxiWbqBsqpAaURW9HKBxgo7obV3Fm/nLxhlJmg2HC?=
 =?us-ascii?Q?XmNVcLg1hhGH6n4Bq7Lic7yhtWs7mZrpsOa5KgVzukgMQ3GksCXetdlOrQy3?=
 =?us-ascii?Q?U9h+k9LabHUu0umwZyno+W2WsOO/LQNgkZWYnW4UxrFYlFomOsis8dhyJNOV?=
 =?us-ascii?Q?bfzcQpKVGV88oWbfARSPNecXkjz8yanMsfd/iXDjOwTmbcof0iZkbmiZaAUq?=
 =?us-ascii?Q?19k8gpgwSa3B/lWguoStqriW/UgSR/ThvHROGFntuFwxWfpTkigAK9sEtlKK?=
 =?us-ascii?Q?5q5oaL51Mg2FO3K6r9WtDcObHnurhIofjzeFg7a39lKbwmkkGu51dlpjbssf?=
 =?us-ascii?Q?LAdjWfbSMvx0zEDQJa6T4CRl6rhtSErqFKupSPECP6+JxTcDu90V62vLN0yN?=
 =?us-ascii?Q?PAnlIAD+rypRjYkeFya4si3IhU5ieAEoTGGlN3GfSb+IvD32iG8S/ynLU716?=
 =?us-ascii?Q?xbATsIJZnczW6+LJETcy1c3majtu7VAObUDW6wTV0exbFdhXaQuKhDM/OG4x?=
 =?us-ascii?Q?OTzkCmRM93S6Jzy9P94=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcb1a1a-b52c-41e4-8990-08dbd5ef6c7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 06:47:29.6610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HCt+t8W7Z7TmRcmLot2/RDUL7/x1wKEqPKVcOdMxJLEEJeEZJg8UYoPzX1EWW4bAr4hfCjQnhGTbI0z6oP4btg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7169
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 26, 2023 11:54 AM

> > Let me work on more mature interface that solves following challenges.
> > 1. ability to create a virtqueue dynamically after driver_ok 2.
> > ability to create virtqueue with one or multiple physical addresses 3.
> > ability for the device to return error if it cannot create dynamic vq
> > creation
> >
> > The question is, do we need this generic facility beyond virtio-net?
>=20
> Wow, sounds rather complex.

Yes and no.

It is if there is any use case for generic devices.
For all the devices which already has cvq, it is fairly straightforward.
All dynamic vqs can be created and destroyed using a simple cvq commands.

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

