Return-Path: <virtio-comment-return-6050-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B43C77B7A
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 15:17:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 06083339B7
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 15:17:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8FB198642D
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 15:16:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D5EAD986351; Wed, 31 May 2023 15:16:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C0466986384;
	Wed, 31 May 2023 15:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1SCCuMxQGyPqdjvJ+87zdi8riX+qormNAMYeo/h6cEt+excY6qhRncbERIs13gO+JPhLJ0Nia+EjDYZbDngAWW5C6If4FLhkiwr9bbhja4uE3c/MATkIbaMaIQ5GQABbJ57//39uwQU8S5QXWfyRcynVJBZcici6lHbML+jGEqv8EAdRf2WL7EyjDBIsrsPZVCzuxUFhhU7VhAcZyoFNO4+tpYtLdVcUvnvVtxp3TGvU4qcCIwFxWhfqZUILj3brFTvDJFIoJuZnrKabhNFg/3MyMZjYyd3sBn1FjtjRAk4rpqC1tZzFGo/Ut/BWnZeLry9xnHx18Q7W9XS/HuHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cl/V0bxxBQhGhgsjohpHcMvKUL0aUi8Sv0ATWSV6dX0=;
 b=FXWGL8iEIDxAlu2/fDORw2E32nz96+UYe1z6gebX3ZSkjFmjY8fJueQK18hrimYcKO3twE+uxvZLScyrxdhclqsdsTsbWjMzyzlclEi1nLLCWkFlNHiLCLOB+sSMiN+veaqvogTExjBP+H2N6GhHT5s/7z5r7KzUgNu1SO+64oZYaXGFRpIVQYKwQRLx2x66f11KKrLcehJlelxvoYnrw+CrUyaKFzR3i8KBwxyK5940FrTuOMNo1ObJA+4YSkeEiayWEWkGBf6NQViqys6eXdRok6H5L/GAN0315EEppITMXSI3bo+lQBN5Oh/wRe6D2CKwbS5UiaE9qkTTb/Wv9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: virtio networking collaboration meeting: call for agenda
Thread-Index: AdmJCcjCjRUFdJrUSz6FqEiskKvSlQKxkfUQ
Date: Wed, 31 May 2023 15:16:53 +0000
Message-ID: 
 <SJ0PR18MB44770CDB2780FB21AEE44975C3489@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: 
 <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: 
 <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|DM6PR18MB3587:EE_
x-ms-office365-filtering-correlation-id: 3d1c8a0b-8d2b-4e7d-0114-08db61ea10f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BAI1s0/n/VYPgfohz5CRiCJ0doChVzggn7TiYOLiDk3HwK/6dBuiEY4UYmt3qlcJM2guOm1/xJqToQrQTYXuJaAGzGTAp1q8xgZLP8+G2sUD8LPB/sxY3caKEfcJaZT2EqTcsMqhAeOORj8hLTp41rIJc3+GwcPMW5IoApX3Kj6xIQFtITtzmwvvTrSqsAloLQJi6Pv1ELFUMiwv/CcESPhG6nFcWbzkGGPILQ0yXUm+OUA1LA5cOuorUxpP3k1Gfq08Fu4FSxYKqzM6rhDOIMGqXO6hnSy48pRooF9Akw7hFmDbcNMy+lm6HIXnNjRXs6tWeE4x4gg3a6gfhw6NthZ7Gv/y1QUtlcrDGLBMR49ccsDGXnJ8ezbX0T5AFXeeuJng5bqD4Q+ZGHt+N8cs4vYKOXzP3YXInIhd73XtKfR4DVHEwSYbSW3VRR5SxXOj4ZdiU41iPotWM2heitJScQPlHQVq5HwB2mQiU5WHVZAK0mluJtZlGIHyeHb3OhCq2mQJTQk92g8bQJoCB1F4GoHHBpG0x2UUr/Ger8UyMD08dxnqK0F9gpDi5s4Z3NobaRyiMH1R6lyJPCdU3+W60bbKpAa/r3S8LO71VO9JzmnBkfO6GtVHAOORCsqfF8EA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199021)(122000001)(33656002)(110136005)(38100700002)(478600001)(66556008)(71200400001)(66446008)(64756008)(66476007)(66946007)(76116006)(7696005)(41300700001)(8676002)(52536014)(5660300002)(8936002)(86362001)(26005)(2906002)(53546011)(55016003)(6506007)(9686003)(186003)(83380400001)(38070700005)(4326008)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?11JauOqVaxhFSepwOF/l1V3OQOaYed6VSPRqJivQ2ivhXq2Omg1QR16+23?=
 =?iso-8859-1?Q?+Vs3m7NkWRqplqk7qRluIcKpZEDCD3VUlFWXyYiGQnX+2rLUfC61/lzOE3?=
 =?iso-8859-1?Q?ns0JdK5I0cAemCFBALBWFZb96PBpHTHU/6Jm+H3uL3L4k2Waz1OhzQCW2H?=
 =?iso-8859-1?Q?yVPgNK8qjI4mH4zKmZljwZyPqkJCEs9NtxVLpFqG0NTMghzYAmbKoywUuE?=
 =?iso-8859-1?Q?Tm8y8TCroxskR2VsmyLHc7nvGGUfFO7wvTsmSAuy0rwd3Ja2xiUJelbjlS?=
 =?iso-8859-1?Q?XMwtNHZ77WDtyfTW2llE0ABWX/GOsT6Ag23FRt0jPnyOOkE9PsPeIRaBH9?=
 =?iso-8859-1?Q?++l2QHiNyxX4t4TVy5lZBcSsz4ZWftq8sKPpoP/eLikALpxLbQiKVF2oTZ?=
 =?iso-8859-1?Q?QJR/NRdJ/U136WqcV/3f7z6KX952hre1rHxlyOn6wf6r4RXJt4qVJecueS?=
 =?iso-8859-1?Q?9L54MHoVOGe2uNAn9RAKkp3Pp1VOxY1WhYqRMG2gGteQf4vPlSGUwwaR/s?=
 =?iso-8859-1?Q?K2cjoojPfrG9ebCzjvFJDxJ5+x3OzJHm9adYTsNPhAnvbxIQ6l0G4L94kz?=
 =?iso-8859-1?Q?eD+exv6ACR63p18qoszywBCsE7uqgRuc8VVXQMl92XT9OE+++TS3jbXHTB?=
 =?iso-8859-1?Q?XzE50e6fU+KnZBXZj45glwbBUyOvj7c9QuoLhUTgk7NRISsEGr8himd7SR?=
 =?iso-8859-1?Q?Pnt5lHomOKGnvOQB+leqQtYqat33Cz6QmD6/VAZ6Pv1YvQkMqw7wu4QdIB?=
 =?iso-8859-1?Q?L07EjDkJacsdwhkzpsVodilx0G4TePoiNZDmq+sssVjvwOdh4TLj49dm9A?=
 =?iso-8859-1?Q?q49nBwZa4UvZ5l2HNNUpuwngOFSgG2r7vW5xuqUYxCT6WloaXO1bqTw7Ew?=
 =?iso-8859-1?Q?kIn7d2UVrA8AR3wYyXy7AE0q5XcoAKsL/B4YAQVHrcv/Wc6/NptQiVoGBp?=
 =?iso-8859-1?Q?Vd+T7W7FAtpH5FzJCEOW81a82k3Wle3xN+sJFvNHHpMzMCp8SdL7f2fs3C?=
 =?iso-8859-1?Q?XQnZyGXmrNiKYnEP7bcYn1EwmwNk/7u3WgozpjfgqMWEr8As7EA3QrjTIF?=
 =?iso-8859-1?Q?UgxZi0ha9QnRZeDoOrtvTak55mJdhCDxHkOcWFtmlaYaKQcivIrmMdjLcK?=
 =?iso-8859-1?Q?u1egMbhenccUak78OKC4pYwDIzZ8BsXb0y1BqXDorV0pjuCo5o0gAxFJWD?=
 =?iso-8859-1?Q?msUgmsoVWs3FnpVN49GsmaPyRC+nbnCwhHH6dtkMt90bAQgB7SXnCnUZqs?=
 =?iso-8859-1?Q?hf3oTBYaxGVOW7xRIPkaucyLhuaqwEkGo3NyePrIBQlk+N6lx0WwamkROg?=
 =?iso-8859-1?Q?932IRRVM8r/iWb+52ut4Yfz9A3F/PHKzcQ2TA2y+dvzQgw/yYcy9/E+BRD?=
 =?iso-8859-1?Q?VIsLK3BC5s66A2Dt+PeAN8EF1WtHTw9owm3iWRmagjGTDKpuQEfqzp2lHW?=
 =?iso-8859-1?Q?xNPYErYqU0CqU9oA5tyVaXzb4IbNH523hL+gKI86wngaJgE6U76RtGV55i?=
 =?iso-8859-1?Q?vUnNjSZPYVFnKS8t6bvoxr40AqDV1Z7FsqeXC3MHKIbucT8/tkwSitivjx?=
 =?iso-8859-1?Q?u6g/p4OH6gvE5nDzqvhf/u9ZG5ZV+LOre/dsvXUq3JcKET8wKlQ9wmdPG+?=
 =?iso-8859-1?Q?W7nRFMNe+37ew=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1c8a0b-8d2b-4e7d-0114-08db61ea10f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 15:16:53.7309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KLq0EpJTN1dN5GKOUCmjBRem7w+PEPWQTzaCbCqPwJqju/YXtoypEVSW3cJGshgJ8g6H7h66GY5E103EoEszyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3587
X-Proofpoint-GUID: kCQQz188ovORYqcqx7GqExuQzOQYubvW
X-Proofpoint-ORIG-GUID: kCQQz188ovORYqcqx7GqExuQzOQYubvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_10,2023-05-31_03,2023-05-22_02
Subject: [virtio-comment] RE: virtio networking collaboration meeting: call for agenda

=0A=
=0A=
> -----Original Message-----=0A=
> From: virtio@lists.oasis-open.org <virtio@lists.oasis-open.org> On=0A=
> Behalf Of Parav Pandit=0A=
> Sent: Wednesday, May 17, 2023 5:54 PM=0A=
> To: virtio@lists.oasis-open.org=0A=
> Cc: virtio-comment@lists.oasis-open.org=0A=
> Subject: [EXT] [virtio] virtio networking collaboration meeting: call=0A=
> for agenda=0A=
> =0A=
> External Email=0A=
> =0A=
> ----------------------------------------------------------------------=0A=
> Hi all,=0A=
> =0A=
> At the moment to my knowledge, many TC members are working on many new=0A=
> features for virtio network device specification - all of us working in=
=0A=
> parallel.=0A=
> =0A=
> I feel a biweekly meeting would help us virtio networking developers=0A=
> collaborate more effectively.=0A=
> For example, we can discuss how do features each one is working on=0A=
> interact, what timeframe is each one targeting, etc.=0A=
> =0A=
> I suggest:=0A=
> - A biweekly meeting using google meet.=0A=
> - Meeting agenda will be posted on list before a week so people=0A=
>   will have a full week to review, respond on the existing mailing=0A=
> lists.=0A=
> - If no agenda items for that meeting day, meeting will be cancelled.=0A=
> - Minutes will be posted on list after a meeting.=0A=
> - non-TC members can also join; this is an additional space to get input=
=0A=
>   from outside experts, under the existing terms of OASIS feedback=0A=
> license.=0A=
> =0A=
> - All decisions are still made by TC electronic ballot as usual.=0A=
> Proposed collaboration=0A=
>   meetings are unrelated to TC ballot. The point is ability to=0A=
> collaborate,=0A=
>   plan and split work better between developers working in the same spec=
=0A=
> area.=0A=
> =0A=
> For the first meeting, I propose the following agenda item:=0A=
> - discuss new virtio net device features for 1.4 spec release=0A=
> =0A=
> I suggest several day & time slots.=0A=
> Days:=0A=
> - Tue (May 30) or=0A=
> - Wed (May 31)=0A=
> Time:=0A=
> - 2 pm GMT, or=0A=
> - 5 am GMT=0A=
Sorry I could not make this one as I am out of office till 5/31. 5 AM GMT w=
orks for me. =0A=
I can attend the next meeting onwards. =0A=
=0A=
Regards=0A=
Satananda=0A=
=0A=

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

