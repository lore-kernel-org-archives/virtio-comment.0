Return-Path: <virtio-comment-return-7637-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0210CD610E
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 17:21:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 38A7F1CA24C
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 17:21:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1775B98654A
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 17:21:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 006629864F0; Mon,  9 Oct 2023 17:21:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E5CB19864F3
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 17:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVp/ZzCKjH330MMN/fz64C3rPu2MXG7YGZ9vGA+iwcdQ19O21EI1R1GjixoywRYy0rodwkd8se0fj6ei2cXxkzwPS7rSpi+VM1zhfMh9B2wgfhZ538RUuvEnhnqEfZhd5+8bwmlU/BTBmQ5vEiZFG3e8QQP5xG5LQro5uW49a4ssMrH0k6FMg0JiqL09/yhJy9YfJ6tIBv3jkrc2hf3q1Qd5ZTrfggo45DSuRZWCqGCl5YpP0fofw5hgGWxHiwS69PiwXXJH6A4oMMGK3U7P7Hh6s/pltPYpwxx5rIb09XE5vzxFfd7m2DN6yMCUea8n7o+lvVly2leIfu04lCzPMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qxyNgLYVc9ul/F4qiOeHhV0+GJuqj4tdavgx+CW6e0=;
 b=eqAsGCnHjdm7CQJaqDfPjTrd3mr4r465BBYo1lHFhenztTRZuRNhBeQIkCitemoIxV0rE2K7gSoRuN40qEiLRoe9hnZijhpu6WoQZ+9kiGzJPTOkiZs7CBmnUcQy+NZyLnayEn73VKpouQwAMsVj29oxptscf6miT8A/5AH5OWnkpRzkPlgTJlFevGavzJyd+3Zbrmgg9YaX23pM6zeLrF0EnFyeWVz7Uu5hRgtk0nIT9TlDM1MVx2J238w5MiNO34d/MZby0xKzIFBrnQf2rUIMS1/NWj44WOIwhM2do/RwiHW17RTkQooOE+m9Y4Nt3aoAlxNvEMwmUaCHKZLAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index: AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjw
Date: Mon, 9 Oct 2023 17:21:32 +0000
Message-ID:
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231009121638-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|CY8PR12MB8243:EE_
x-ms-office365-filtering-correlation-id: 65ad45c9-9ef9-4998-95b7-08dbc8ec2e93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hUktQ7zHg4Qp6eXpGK5E08J0ajCEqeSh23Kw3FSVqc19z4rTIaZbFGZZNZdzEDkBZuMVk0+ztxqGb5MByOesUQtXbDCI9eTtU6nRrkghpSVsQ1FXHVXyOgrpORN8PwEJOdL8q0opdpVGOkXZjLmE3/UY51HwKQvn1YqmpYLQfSAWfTf4MmI7EG+96ZgGRyTucDWeinebuHze3ArQQGLZTY/Chzjxmh4MZRwxQwCvs3yH7uASEVHsm3uqe6NSGDpOfueytJz/S+d03i2srr0Ti8/NYlu81VrZeja0S4ztOdgs1o8DmD81GDBiJ/6ZuBmKmbefe0E0K8P5P6/jBbBsVOE1QJZy161QIMjjojeGGnqkM65mM/LuZSm6bGykaFp+leesJ0UYlzXbZHLy62ExGSyyfzg4kwlxtLEV3q8YlhBTj5iCSNgXZ05dlRZFhevqMbG8bQfiIER8IvOXudons/H2wjHh+pOzONDorNqE5YJ+crYGn1vAGm1ChEvvMeh/KvyKDQdJDHSsbfQ/QTVKfJZ4gSfKZLKcp0eF0+wcUAmyfLEhN3fGJfCcbKd+AHaO/EMeKJjg50VGbgQMVNw/bPaRiQ3EJzM9hJV0FS0E94pP2Zm0xd1zroN30bbrZ7yO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(122000001)(38100700002)(38070700005)(86362001)(33656002)(71200400001)(55016003)(2906002)(9686003)(478600001)(52536014)(4744005)(4326008)(41300700001)(8936002)(8676002)(7696005)(5660300002)(6506007)(54906003)(66556008)(76116006)(6916009)(66446008)(316002)(66946007)(66476007)(26005)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWdLeWwrenFFZlM5RFVLemZBeS9NSWZqVnI3eldCd05TdWV0aVltSmZkamRu?=
 =?utf-8?B?OEx5TlI4aEUvK2VhMUhvaWJIWXJIa0VLcEJvb1hQU0g2S2xmaE5kUmh0MDBy?=
 =?utf-8?B?ajkwYS91ZUVMRDZUNW1TWVBzN1l3L2t5VlZINjIyR2JqTHUxQ1lwWkpEQmw1?=
 =?utf-8?B?cnFLNFVMcVlyWHBGakU2T1lyY2VrTTZTMk5pV0s4d0JIcnBZTzJaZysxd1Nw?=
 =?utf-8?B?UG9sK2RoL05ua1BnV05uRVFCMXJWZEdrTWtpMWFidjQzQUVZT1lGNWR6b090?=
 =?utf-8?B?em1POTJRRjZ0M280NW0zMy9sWWtxejhudXVuMGpHdUdVYXpQOWl3V3pEQWcr?=
 =?utf-8?B?QjAwOTdrUGRKdGE5bFNyS01RUkk5dXRYNjU0QkRrYWpZanhxakdIbDY2Z1pE?=
 =?utf-8?B?T3B2eEYwSzhKTU1HbC93dDRWU3k4bUhnZkNiL0dLSkpHcmh6SVVZME5QVlY2?=
 =?utf-8?B?Q2ltRmpHUElJTUIyaWxzVW1CTHFsRmpYeDdhYWFmeHo0NllTOUhYNWgvZGc2?=
 =?utf-8?B?VytFbG1UalBGZEVDbkRGNkN5VEw0ZlR2aXhsdlowdmVnQnVHRnRSQ1hHaWM1?=
 =?utf-8?B?UGsyZXg5YTFJVHgrTkZod205eW9tZG1uVWhEdWlNUUdDN3pCQ1MwcmZMTUpm?=
 =?utf-8?B?SHZ2TnJJelZadFZuaCs2Z012YWlzb0Y1WXQ1cW1WcU1pRk43bTJ4Y0Y2WFBX?=
 =?utf-8?B?SmtnUmZBeW9BQkxtK0F3R1dRV2JmdXlKeVkyemFpWG1YdE5iZWI2Y21saHlH?=
 =?utf-8?B?UnhwdnRQVlB5MDJvRWFaVFZBWE9zeXlPRzZ4TDM3RzVpenJMd1Vaa0FhaThx?=
 =?utf-8?B?Z0dtZkl3ZGlTMUNzNndKdCtJMStWbUY3dVZKbm9xOGhwYU0wWWF5WE1ORlk4?=
 =?utf-8?B?MVJ1WWtpMTl3dzlYVWo1VjlwS2Mwek9KRW4zT1FDSlZhTmg4R2gyM3NmVlBl?=
 =?utf-8?B?TWVuZ2o5clhTTjBYU0t2dTdKSkFMYmVLWDREZ05FTkJHd21vWThsVWV4dUpC?=
 =?utf-8?B?QjJrcFFSL0N2a3pVc0J5VG4zTlVNdEhZNGxtRDI3QVNBR1BnN2hCa0lDS3dI?=
 =?utf-8?B?ZmdzWkloaXczOXNYSjVyYjVmZHkwQkRDV0tjUXNjdzR5dlVvZEdoZHUrNnNB?=
 =?utf-8?B?SUZBV1d0NHFSNmlGUCtmNlNiQlJiQTB5QjYzTUZyZjAxZ1J2cXh1UFcyUkhv?=
 =?utf-8?B?NFhKWjgvb3R2K2pzWHoyejVYWVJCUE50bE9UL0RVUVY3TXVKQlVNTXBoKzJU?=
 =?utf-8?B?NEpMZVR2WFJvcVRtZEZCY2tkSzBPYzMvbnZBcndacXJvakgyd0ViN2Jremsy?=
 =?utf-8?B?ZWw5cEFtNnYyK2QySzZ6c1hBUHppeGpuRXJwV0Jab3l4Q3BSRFZYT0hLU1FM?=
 =?utf-8?B?eWpsYmZabHJWZ0NjMllScE80MjJkK3ArQzAyS1h5RGUrR01CeEluaDQ3UmtD?=
 =?utf-8?B?VGtZQnRQSFFrTlNjUHl0blVyKzc5d0JxMVU4TmVON3o0UUorUU5VK0VSbUhK?=
 =?utf-8?B?R05obDF1d3NyMWJ2dytSSEdpdUJSSjVpNDR2Z053ZG9lT01KOWh1RW5VWFJH?=
 =?utf-8?B?bTgvZnFEblQwWEc3eWRGMXZYWW9QNE5saE1TYnVuZzJtT1U5SGRkTWwvOUxW?=
 =?utf-8?B?UEgyenF4dk8rMjYvUVM5MzJ2ZWZUOG9HVlpuUkdPdWg4Yk1PMlV5MEc3UDRV?=
 =?utf-8?B?N2Y4UTZ6OHJiZExJczNYRUJoZ3VqMGljMUtQenVINVFzdHJHNWw4UVlKeTZD?=
 =?utf-8?B?WHRHV0Nnd0lpZU1YNXFBdGJSU0tsRGtpUmg4STlpRHdkL3VUSlRTRHppMlZp?=
 =?utf-8?B?RDBxTFRvSmtVT3pqMDJ5RXZhVzhPME52TVVhNDNYOVlMN2hLUFhZdVh1aFBG?=
 =?utf-8?B?RncyZFY2bGxWb2RkdXZoS1NMUHFScnBGTlhhYzVEeU83WDREemE2QU0xOThH?=
 =?utf-8?B?RDhCa2NVcHlQRmJ2UEQvb2hQREk1OWoyeXN3M0VycFgvRmEyMEVkU1lVUmMw?=
 =?utf-8?B?bGVtRUdvWEhSOVlOSG9VNWN1QTQrL0JtWFg3YTBpSTM3Yyt4SStCQTBnM1dD?=
 =?utf-8?B?OGhZODFTT0lkTlRkV214MFExTzUxank5MElKcElROHpCczdUZFkwYjhydTRX?=
 =?utf-8?Q?dyKA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ad45c9-9ef9-4998-95b7-08dbc8ec2e93
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 17:21:32.2039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0/B6Q5QxaORQwb4m/TDbGqgd5/xWW87YesIySrmaqfucyLA7X25hv2FdkvHPGKixLJJDMgCbj72YWr7Vyd5jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8243
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQoNCj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gU2VudDog
TW9uZGF5LCBPY3RvYmVyIDksIDIwMjMgOTo1MCBQTQ0KDQo+ID4gPiA+IE9uZSBvciBtb3JlIHBh
c3N0aHJvdWdoIFBDSSBWRiBkZXZpY2VzIGFyZSB1YmlxdWl0b3VzIGZvciB2aXJ0dWFsDQo+ID4g
PiA+IG1hY2hpbmVzIHVzYWdlIHVzaW5nIGdlbmVyaWMga2VybmVsIGZyYW1ld29yayBzdWNoIGFz
IHZmaW8gWzFdLg0KPiA+ID4NCj4gPiA+IE1lbnRpb25pbmcgYSBzcGVjaWZpYyBzdWJzeXN0ZW0g
aW4gYSBzcGVjaWZpYyBPUyBtYXkgbWlzbGVhZCB0aGUNCj4gPiA+IHVzZXIgdG8gdGhpbmsgaXQg
Y2FuIG9ubHkgd29yayBpbiB0aGF0IHNldHVwLiBMZXQncyBub3QgZG8gdGhhdCwNCj4gPiA+IHZp
cnRpbyBpcyBub3Qgb25seSB1c2VkIGZvciBMaW51eCBhbmQgVkZJTy4NCj4gPiBUaGlzIGlzIGp1
c3Qgb25lIGV4YW1wbGUgb24gaG93IHRoZXNlIGNvbW1hbmRzIGFyZSB1c2VmdWwuDQo+ID4gSXQg
Y2FuIGJlIHVzZWZ1bCBpbiBtb3JlIHdheXMgdG9vIGluIG1vcmUgT1NlcyB0b28uDQo+ID4gSSB3
aWxsIGRyb3AgZnJvbSB0aGUgcGF0Y2ggY29tbWl0IGxvZyBhbmQga2VlcCBhcyBpbmZvcm1hdGlv
biBwdXJwb3NlIGluDQo+IGNvdmVyIGxldHRlci4NCj4gPiBXb3VsZCB0aGF0IHdvcmsgZm9yIHlv
dT8NCj4gPg0KPiA+IEkgZG9u4oCZdCBoYXZlIGFueSBzdHJvbmcgb3BpbmlvbiB0byBrZWVwIGl0
IG9yIHJlbW92ZSBpdCBhcyBtb3N0IHN0YWtlaG9sZGVycw0KPiBoYXMgdGhlIGNsZWFyIHZpZXcg
b2YgcmVxdWlyZW1lbnRzIG5vdy4NCj4gPiBMZXQgbWUga25vdy4NCj4gDQo+IFNvIHNvbWUgcGVv
cGxlIHVzZSBWRnMgd2l0aCBWRklPLiBIZW5jZSB0aGUgbW9kdWxlIG5hbWUuICBUaGlzIHNlbnRl
bmNlIGJ5DQo+IGl0c2VsZiBzZWVtcyB0byBoYXZlIHplcm8gdmFsdWUgZm9yIHRoZSBzcGVjLiBK
dXN0IGRyb3AgaXQuDQpPay4gV2lsbCBkcm9wLg0K

